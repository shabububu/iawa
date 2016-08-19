class CollectionForm < CurationConcerns::Forms::CollectionEditForm
  delegate :id, to: :model

  # TODO: remove this when https://github.com/projecthydra/hydra-editor/pull/115
  # is merged and hydra-editor 3.0.0 is released
  delegate :model_name, to: :model
  self.terms += [:source, :bibliographic_citation, :rights_holder, :coverage]
  self.required_fields = [:title, :rights, :identifier, :rights_holder]

  def primary_terms
    [:title, :description, :creator, :source, :date_created, :rights,
     :language, :identifier, :bibliographic_citation, :rights_holder,
     :coverage, :subject]
  end

  def secondary_terms
    [:contributor,
     :keyword,
     :publisher,
     :subject,
     :based_near,
     :related_url,
     :resource_type]
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
