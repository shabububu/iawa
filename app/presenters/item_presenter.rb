class ItemPresenter < Sufia::WorkShowPresenter
  delegate :tags, :coverage, :part_of, :medium, :bibliographic_citation,
           :rights_holder, :format, to: :solr_document
end
