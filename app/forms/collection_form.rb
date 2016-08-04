class CollectionForm < CurationConcerns::Forms::CollectionEditForm
  delegate :id, to: :model

  # TODO: remove this when https://github.com/projecthydra/hydra-editor/pull/115
  # is merged and hydra-editor 3.0.0 is released
  delegate :model_name, to: :model

  def primary_terms
    [:title, :description, :creator, :source, :date_created, :rights,
     :language, :identifier, :bibliographic_citation, :rights_holder]
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
end
