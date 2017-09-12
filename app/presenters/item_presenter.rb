class ItemPresenter < Hyrax::WorkShowPresenter
  delegate :tags, :date, :coverage, :part_of, :medium, :bibliographic_citation,
           :rights_holder, :format, :contributor, to: :solr_document
end
