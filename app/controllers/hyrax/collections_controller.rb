module Hyrax
  class CollectionsController < ApplicationController
    include CollectionsControllerBehavior
    include BreadcrumbsForCollections
    require 'iawa/download_generator'

    skip_load_and_authorize_resource :only => [:export_metadata, :batch_export]

    def export_metadata
      time_stamp = DateTime.now.strftime('%Q')
      csv_generator = DownloadGenerator.new(time_stamp)
      csv_generator.make_archive
      csv_generator.export_collection_metadata(params[:id])
      zip_file = csv_generator.zip
      while !File.file? zip_file
        sleep(0.1)
      end
      send_file zip_file
    end

    def batch_export
      time_stamp = DateTime.now.strftime('%Q')
      download_generator = DownloadGenerator.new(time_stamp)
      download_generator.make_archive
      download_generator.download_collection(params[:id])
      zip_file = download_generator.zip
      while !File.file? zip_file
        sleep(0.1)
      end
      send_file zip_file
    end
  end
end
