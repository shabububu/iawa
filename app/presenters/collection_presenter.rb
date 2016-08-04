class CollectionPresenter < Sufia::CollectionPresenter
  delegate :bibliographic_citation, :rights_holder, to: :solr_document

  # Terms is the list of fields displayed by app/views/collections/_show_descriptions.html.erb
  def self.terms
    [:title, :description, :creator, :source, :date_created, 
     :rights, :language, :identifier, :bibliographic_citation, :rights_holder]
  end
end

