# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  class ItemForm < Sufia::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :coverage, :part_of, :medium,
                   :bibliographic_citation, :rights_holder, :format]

    self.required_fields = [:title, :rights, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date_created,
      :rights, :language, :resource_type, :identifier, :coverage, :part_of,
      :medium, :bibliographic_citation, :rights_holder, :format]
    end

    def self.multiple?(term)
      return false if :rights ==  term
      super
    end

    class << self
      # Overriden Sufia 7 and set 'rights' as it is
      def sanitize_params(form_params)
        form_params.permit(*permitted_params)
      end
    end
  end
end
