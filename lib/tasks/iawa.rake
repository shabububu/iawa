namespace :iawa do
  desc 'Create default roles.'
  task add_roles: :environment do
    ['admin', 'archivist'].each do |role_name|
      Role.find_or_create_by({name: role_name})
      puts "Created role '#{role_name}'."
    end
  end

  desc 'Upgrade users to admins.'
  task upgrade_users: :environment do
    admin_role = Role.find_by({name: 'admin'})

    IO.foreach('admin_list.txt') do |email|
      email = email.strip
      user = User.find_by({email: email})

      if !user.nil?
        user.roles << admin_role
        user.roles = user.roles.uniq
        user.save!
        puts "#{email} upgraded."
      else
        puts "#{email} user does not exist in system."
      end
    end
  end

  # usage: rake iawa:update_images['vendor/assets/images/iawa.zip']
  desc 'Update carousel images from zip.'
  task :update_images, [:image_zip] => :environment do |task, args|
    image_zip_path = args.with_defaults(image_zip: nil)[:image_zip]
    FileUtils.mkdir_p(Rails.root.join('app', 'assets', 'images', 'vtul', 'carousel'))
    images = Dir.glob(Rails.root.join('app', 'assets', 'images', 'vtul', 'carousel', '*.[Jj][Pp][Gg]'))
    unless images.empty?
      images.each do |image|
        puts "Deleting #{image}"
      end
      FileUtils.rm(images)
    end
    unless image_zip_path.nil?
      system("unzip -jd #{Rails.root.join('app', 'assets', 'images', 'vtul', 'carousel')} #{image_zip_path}")
    end
  end

  desc 'Establish initial controlled vocabularies for medium, tags, resource type fields'
  task add_controlled_vocabs: :environment do
    medium_names = ["Blueprints", "Charcoal", "Color pencil", "Computer-aided design",
		    "Graphite", "Ink","Marker pen", "Linocuts (prints)",
                    "Photographic Print - Black and White", "Photographic print - Color",
		    "Printed ink", "Watercolors", "Woodcut (prints)"]
    medium_names.each do |name|
      ControlledVocab.find_or_create_by(name: name) do |c_v|
        c_v.field = 'medium_sim'
        c_v.image_filename = name.downcase.gsub(/[\W_]/,'') + '.jpg'
      end
    end
    type_names = ["Articles", "Clippings", "Correspondence", "Curriculum Vitae",
                  "Digital 3D model", "Computer drawings", "Digital renderings",
                  "Documents", "Architectural drawings (visual works)", "As-built drawings",
                  "Axonometric projections (images)", "Conceptual drawings",
                  "Detail drawings (drawings)", "Detail studies", "Elevations (orthographic projections)",
                  "Floor plans (orthographic projections)", "Interior design",
                  "Perspective views (images)", "Presentation drawings (proposals)",
                  "Sections (orthographic projections)", "Site plans", "Letters",
                  "Newsletters", "Notebooks", "Pamphlets", "Photographs", "Architectural models",
                  "Postcards", "Posters", "Scale models", "Sketchbooks", "Sketches", "Travel sketches"]
    type_names.each do |name|
      ControlledVocab.find_or_create_by(name: name) do |c_v|
        c_v.field = 'resource_type_sim'
        c_v.image_filename = name.downcase.gsub(/[\W_]/,'') + '.jpg'
      end
    end
    tags_names = ["single-story", "two-story", "3 to 5 stories", "6 to 10 stories", "11 to 20 stories",
                  "Commercial and Office", "Educational and Research", "Healthcare", "Industrial",
                  "Interior Design", "Landscape Architecture", "Portrait", "Residential",
                  "Residential-Housing development", "Residential-Multi-family", "Residential-Single-family",
                  "Single-family", "Urban Design", "Student projects"]
    tags_names.each do |name|
      ControlledVocab.find_or_create_by(name: name) do |c_v|
        c_v.field = 'tags_sim'
      end
    end
  end
end
