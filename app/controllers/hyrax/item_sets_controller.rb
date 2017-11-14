# Generated via
#  `rails generate hyrax:work ItemSet`

module Hyrax
  class ItemSetsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::ItemSet

    def show
      super
      item_set = ItemSet.find(params[:id])
      @items = item_set.items      
    end
  end
end
