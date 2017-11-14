# Generated via
#  `rails generate hyrax:work Item`

module Hyrax
  class ItemsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Item
    self.show_presenter = ::ItemPresenter

    def show
      super
      item = Item.find(params[:id])
      @item_set = item.item_set
    end
  end
end
