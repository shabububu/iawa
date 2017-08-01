# Generated via
#  `rails generate hyrax:work Performance`
module Hyrax
  class PerformanceForm < Hyrax::Forms::WorkForm
    self.model_class = ::Performance
    self.terms += [:resource_type]
  end
end
