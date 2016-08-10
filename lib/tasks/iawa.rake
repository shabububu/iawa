namespace :iawa do

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