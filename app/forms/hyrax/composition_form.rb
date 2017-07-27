# Generated via
#  `rails generate hyrax:work Composition`
module Hyrax
  class CompositionForm < Hyrax::Forms::WorkForm
    self.model_class = ::Composition
    self.terms += [:resource_type]
  end
end
