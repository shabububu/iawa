# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  class ItemForm < Sufia::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :part_of, :medium, :bibliographic_citation,
                   :rights_holder, :format]

    self.required_fields = [:title, :rights, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date_created,
      :rights, :language, :resource_type, :identifier, :part_of,
      :medium, :bibliographic_citation, :rights_holder, :format]
    end

    def self.multiple?(field)
      if field.to_sym == :identifier
        false
      else
        super
      end
    end

    # cast identifier back to multivalued so it will actually deposit
    def self.model_attributes(_)
      attrs = super
      attrs[:identifier] = Array(attrs[:identifier]) if attrs[:identifier]
      attrs
    end
  end
end
