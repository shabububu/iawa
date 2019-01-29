require 'net/ldap'

namespace :iawa do
  desc 'Create default roles.'
  task add_roles: :environment do
    ['admin', 'archivist'].each do |role_name|
      Role.find_or_create_by({name: role_name})
      puts "Created role '#{role_name}'."
    end
  end

  desc 'Add initial users.'
  task  populate_users: :environment do
    ldap = Net::LDAP.new(host: 'directory.vt.edu')
    ldap.bind
    treebase = 'ou=People,dc=vt,dc=edu'
    ldap_attributes = {display_name: :displayname, department: :department}
    #Address is available as :postaladdress as well.

    IO.foreach('user_list.txt') do |line|
      line = line.split
      uid = line[0]
      pid = line[1]
      filter = Net::LDAP::Filter.eq('uid', uid)
      results = ldap.search(base: treebase, filter: filter)
      if results.count == 1
        result = results[0]

        user = User.find_or_initialize_by({uid: pid})
        user.provider = 'cas'
        user.email = (result.respond_to?(:mail) ? result[:mail][0] : "#{pid}@vt.edu")
        ldap_attributes.each do |user_attr, ldap_attr|
          user_attr = user_attr.to_sym
          if result.respond_to?(ldap_attr)
            user[user_attr] = result[ldap_attr][0].force_encoding('UTF-8')
          end
        end

        new_user = user.id.nil?
        user.save!
        if new_user
          puts "Created '#{pid}'."
        else
          puts "Updated '#{pid}'."
        end
      elsif results.count > 1
        puts "Searching for '#{pid}' did not return a unique result."
      else
        puts "Searching for '#{pid}' did not return any results."
      end
    end
  end

  desc 'Upgrade users to admins.'
  task upgrade_users: :environment do
    admin_role = Role.find_by({name: 'admin'})

    IO.foreach('admin_list.txt') do |pid|
      pid = pid.strip
      user = User.find_by({uid: pid})

      if !user.nil?
        user.roles << admin_role
        user.roles = user.roles.uniq
        user.save!
        puts "#{pid} upgraded."
      else
        puts "#{pid} user does not exist in system."
      end
    end
  end

  desc 'Establish initial controlled vocabularies for medium, tags, resource type fields'
  task add_controlled_vocabs: :environment do
    medium_names = ["Blueprints", "Charcoal", "Colored pencil", "Computer-aided design",
                    "Diazotypes (copies)", "Etchings (prints)", "Graphite", "Ink",
                    "Linocuts (prints)", "Marker pen", "Negatives (photographs)",
                    "Pastels (Visual works)", "Photographic Print - Black and White",
                    "Photographic print - Color", "Printed ink", "Slides (photographs)",
                    "Stats (copies)", "Watercolors", "Woodcut (prints)"]
    medium_names.each do |name|
      ControlledVocab.where(name: name, field: 'medium_sim').first_or_create do |c_v|
        c_v.image_filename = name.downcase.gsub(/[\W_]/,'') + '.jpg'
      end
    end
    type_names = ["Architectural drawings (visual works)", "Architectural models", "Articles",
                  "As-built drawings", "Axonometric projections (images)", "Clippings",
                  "Computer drawings", "Conceptual drawings", "Contact sheets", "Correspondence",
                  "Curriculum Vitae", "Detail drawings (drawings)", "Detail studies",
                  "Digital 3D model", "Digital renderings", "Documents", "Electrical drawings",
                  "Electrical plans", "Elevations (orthographic projections)",
                  "Ephemera", "Floor plans (orthographic projections)", "Foundation plans",
                  "Framing plans", "Handbooks and manuals", "Interior design", "Letters", "Maps",
                  "Mechanical drawings (building systems drawings)", "Newsletters", "Notebooks",
                  "Pamphlets", "Perspective views (images)", "Photographs", "Postcards", "Posters",
                  "Presentation drawings (proposals)", "Reflected ceiling plans", "Roofs",
                  "Scale models", "Schedules (architectural records)", "Sections (orthographic projections)",
                  "Site plans", "Sketchbooks", "Sketches", "Travel sketches"]
    type_names.each do |name|
      ControlledVocab.where(name: name, field: 'resource_type_sim').first_or_create do |c_v|
        c_v.image_filename = name.downcase.gsub(/[\W_]/,'') + '.jpg'
      end
    end
    tags_names = ["11 to 20 stories", "3 to 5 stories", "6 to 10 stories", "Associations and committees",
                  "Awards", "Biographical information", "Commercial and office", "Educational and research",
                  "Exhibitions (events)", "Faculty papers", "Galleries (display spaces)", "Healthcare",
                  "Historic preservation", "Industrial", "Interior design", "Landscape architecture",
                  "Office records", "Personal papers", "Portrait", "Professional papers", "Project records",
                  "Public buildings (governmental buildings)", "Recreation buildings", "Reference files",
                  "Religious building spaces", "Renovations", "Residential", "Residential-housing development",
                  "Residential-multi-family", "Residential-single-family", "Single-story", "Sketching",
                  "Student work", "Travel", "Two-story", "Urban design"]
    tags_names.each do |name|
      ControlledVocab.where(name: name, field: 'tags_sim').first_or_create
    end
  end

  # usage: iawa:batch_upload_files['external_uploads/spec_scan.zip']
  desc 'Batch upload from mounted file system'
  task :batch_upload_files, [:image_zip] => [:environment] do |task, args|
    # start where we are told to go
    image_zip_path = args.with_defaults(image_zip: nil)[:image_zip]
    puts "Extracting files from #{image_zip_path}"
    tmp_path = Dir.mktmpdir("external_uploads", Rails.root.join('tmp'))
    puts "Extracting files into #{tmp_path}"
    unless image_zip_path.nil?
      Archive.extract(image_zip_path, tmp_path)
    end
    user = User.find_by_email("tvj@vt.edu")
    # get all files below
    file_path = Rails.root.join(tmp_path, File.basename(image_zip_path, ".*"), '*')
    puts "Get all files from #{file_path}"
    files = Dir.glob(file_path)
    uploaded_files = Array.new
    # for each filename
    files.each do |file_path|
      title = File.basename(file_path)
      id = File.basename(file_path, "_*")
      item = Item.where(identifier: [id]).first
      # attach file if item lacks file
      unless item.nil? || item.has_file_titled?(title)
        uploaded_files <<  Hyrax::UploadedFile.create(user: user, file: File.open(file_path))
      end
    end
    if uploaded_files.empty?
      puts "No new files to be uploaded"
    else
      batch_upload = BatchUpload.new({files: uploaded_files})
      batch_upload.save
      puts "Start ingesting #{uploaded_files.size} new files."
    end
  end

end
