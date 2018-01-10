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
    ldap_attributes = {uid: :authid, display_name: :displayname, department: :department}
    #Address is available as :postaladdress as well.

    IO.foreach('user_list.txt') do |email|
      email = email.strip
      filter = Net::LDAP::Filter.eq('mail', email)
      results = ldap.search(base: treebase, filter: filter)
      if results.count == 1
        user = User.find_or_initialize_by({email: email})
        user.provider = 'cas'

        result = results[0]
        ldap_attributes.each do |user_attr, ldap_attr|
          user_attr = user_attr.to_sym
          if result.respond_to?(ldap_attr)
            user[user_attr] = result[ldap_attr][0].force_encoding('UTF-8')
          end
        end

        new_user = user.id.nil?
        user.save!
        if new_user
          puts "Created '#{email}'."
        else
          puts "Updated '#{email}'."
        end
      elsif results.count > 1
        puts "Searching for '#{email}' did not return a unique result."
      else
        puts "Searching for '#{email}' did not return any results."
      end
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
