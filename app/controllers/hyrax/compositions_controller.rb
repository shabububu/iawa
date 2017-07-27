# Generated via
#  `rails generate hyrax:work Composition`

module Hyrax
  class CompositionsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Composition
  end
end
