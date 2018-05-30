# Generated via
#  `rails generate hyrax:work Item`

module Hyrax
  class ItemsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Item
    self.show_presenter = ::ItemPresenter

    skip_load_and_authorize_resource only: [:manifest, :mirador_frame]

    def show
      super
      item = Item.find(params[:id])
      @images = item.file_sets.select(&:image?).sort_by { |img| img.title.first }
    end

    def manifest
      headers['Access-Control-Allow-Origin'] = '*'
      respond_to do |format|
        format.json { render json: manifest_builder.to_h }
      end
    end

    def mirador_frame
      @manifest_url = presenter.manifest_url
      render :layout => false
    end

    private

      def manifest_builder
        IIIFManifest::ManifestFactory.new(presenter)
      end
  end
end
