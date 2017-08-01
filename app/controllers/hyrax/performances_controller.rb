# Generated via
#  `rails generate hyrax:work Performance`

module Hyrax
  class PerformancesController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Performance
  end
end
