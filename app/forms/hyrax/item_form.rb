# Generated via
#  `rails generate hyrax:work Item`
module Hyrax
  class ItemForm < Hyrax::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :date_created, :coverage, :location, :medium,
                   :bibliographic_citation, :rights_holder, :format,
                   :related_url, :contributor]
    self.terms -= [:keyword]
    self.required_fields = [:title, :rights, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date_created,
      :rights, :language, :resource_type, :identifier, :coverage, :location,
      :medium, :bibliographic_citation, :rights_holder, :format, :related_url,
      :contributor]
    end

    def [](key)
      if key.to_s == "title"
        super.first || ""
      else
        super
      end
    end

    def multiple?(field)
      if [:title].include? field.to_sym
        false
      else
        super
      end
    end

    module ClassMethods
      def multiple?(field)
        if [:title].include? field.to_sym
          false
        else
          super
        end
      end

      def model_attributes(form_params)
        attrs = super
        attrs[:title] = Array(attrs[:title]) if attrs[:title]
        attrs
      end
    end

  end
end
