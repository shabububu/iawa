module Hyrax
  class DashboardController < ApplicationController
    include Hyrax::DashboardControllerBehavior
    require 'iawa/download_generator'

    def admin_metadata_export
      time_stamp = DateTime.now.strftime('%Q')
      csv_generator = DownloadGenerator.new(time_stamp)
      csv_generator.make_archive
      csv_generator.export_all_metadata('Collection')
      csv_generator.export_all_metadata('Item')
      zip_file = csv_generator.zip
      while !File.file? zip_file
        sleep(0.1)
      end
      send_file zip_file
    end
  end
end
