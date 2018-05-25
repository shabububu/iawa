# Generated via
#  `rails generate hyrax:work Item`
module Hyrax
  class ItemForm < Hyrax::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:tags, :resource_type, :date, :coverage, :location, :medium,
                   :bibliographic_citation, :rights_holder, :format,
                   :related_url, :contributor]
    self.terms -= [:keyword, :license, :based_near]
    self.required_fields = [:title, :license, :identifier, :rights_holder]

    def primary_terms
      [:title, :tags, :description, :creator, :source, :date_created, :date,
      :license, :language, :resource_type, :identifier, :coverage, :location,
      :medium, :bibliographic_citation, :rights_holder, :format, :related_url,
      :contributor]
    end

  end
end
