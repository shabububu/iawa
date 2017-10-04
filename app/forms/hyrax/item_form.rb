# Generated via
#  `rails generate hyrax:work Item`
module Hyrax
  class ItemForm < Hyrax::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :date, :coverage, :part_of, :medium,
                   :bibliographic_citation, :rights_holder, :format,
                   :related_url, :contributor]
    self.terms -= [:date_created]
    self.required_fields = [:title, :rights, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date,
      :rights, :language, :resource_type, :identifier, :coverage, :part_of,
      :medium, :bibliographic_citation, :rights_holder, :format, :related_url,
      :contributor]
    end

    def multiple?(field)
      if [:title].include? field.to_sym
        false
      else
        super
      end
    end

    def self.model_attributes(_)
      attrs = super
      attrs[:title] = Array(attrs[:title]) if attrs[:title]
      attrs
    end

    def [](key)
      if key.to_s == "title"
        super.first || ""
      else
        super
      end
    end

    class << self
      # Overriden Sufia 7 and set 'rights' as it is
      def sanitize_params(form_params)
        form_params.permit(*permitted_params)
      end
    end
  end
end
