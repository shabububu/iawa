class ItemPresenter < CurationConcerns::WorkShowPresenter
  delegate :medium, to: :solr_document
end
