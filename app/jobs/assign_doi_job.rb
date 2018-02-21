class AssignDoiJob < ActiveJob::Base
  attr_reader :item_id, :base_url
  queue_as :default

  def perform(item_id, base_url)
    item = Item.find(item_id)
    minted_doi = Ezid::Identifier.mint(
      target: "#{base_url}/concern/items/#{item_id}",
      datacite_creator: (item.creator.empty? ? "" : item.creator.first), 
      datacite_resourcetype: "Collection",
      datacite_title: item.title.first,
      datacite_publisher: "Special Collections, University Libraries, Virginia Tech",
      datacite_publicationyear: (item.date_created.nil? ? "" : item.date_created)
     )
    doi = minted_doi.id
    id_array = item.identifier.to_a << doi
    item.identifier = id_array
    bibli_citation = item.bibliographic_citation || String.new
    item.bibliographic_citation = bibli_citation + " Available from [" + "http://ezid.cdlib.org/id/#{doi}" + "]"
    item.save
  end
end
