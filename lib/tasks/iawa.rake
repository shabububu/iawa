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
    FileUtils.mkdir_p(Rails.root.join('app/assets/images/carousel/'))
    images = Dir.glob(Rails.root.join('app/assets/images/carousel/*.[Jj][Pp][Gg]'))
    unless images.empty?
      images.each do |image|
        puts "Deleting #{image}"
      end
      FileUtils.rm(images)
    end
    unless image_zip_path.nil?
      system("unzip -jd #{Rails.root.join('app/assets/images/carousel/')} #{image_zip_path}")
    end
  end
end
