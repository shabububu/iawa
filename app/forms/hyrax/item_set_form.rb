# Generated via
#  `rails generate hyrax:work ItemSet`
module Hyrax
  class ItemSetForm < Hyrax::Forms::WorkForm
    self.model_class = ::ItemSet
    self.terms += [:resource_type]
  end
end
