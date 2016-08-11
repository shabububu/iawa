class ItemPresenter < Sufia::WorkShowPresenter
  delegate :coverage, :medium, :bibliographic_citation, :rights_holder, to: :solr_document
end
