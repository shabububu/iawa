# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  class ItemForm < Sufia::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:resource_type, :coverage, :medium, :rights_holder]

    self.required_fields = [:title, :creator, :identifier]

    def primary_terms
      [:title, :subject, :description, :creator, :source, :date_created,
      :rights, :language, :resource_type, :identifier, :part_of,
      :coverage, :medium, :bibliographic_citation,
      :rights_holder, :keyword]
    end
  end
end
