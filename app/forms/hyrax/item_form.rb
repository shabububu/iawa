# Generated via
#  `rails generate hyrax:work Item`
module Hyrax
  class ItemForm < Hyrax::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :date, :coverage, :location, :medium,
                   :bibliographic_citation, :rights_holder, :format,
                   :related_url, :contributor]
    self.terms -= [:keyword]
    self.required_fields = [:title, :rights_statement, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date_created, :date,
      :rights_statement, :language, :resource_type, :identifier, :coverage, :location,
      :medium, :bibliographic_citation, :rights_holder, :format, :related_url,
      :contributor]
    end

  end
end
