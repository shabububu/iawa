class AssignDoiJob < ActiveJob::Base
  attr_accessor :item_id, :base_url
  queue_as :assign_doi

  def perform(item_id, base_url)
    item = Item.find(item_id)
    minted_doi = Ezid::Identifier.mint(
      target: "#{base_url}/concern/items/#{item_id}",
      datacite_creator: (item.creator.empty? ? "" : item.creator.first), 
      datacite_resourcetype: "IAWA Item",
      datacite_title: item.title.first,
      datacite_publisher: "Special Collections, University Libraries, Virginia Tech",
      datacite_publicationyear: (item.date_created.empty? ? "" : item.date_created)
     )
    doi = minted_doi.id
    id_array = item.identifier.to_a << doi
    itme.identifier = id_array
    bibli_citation = item.bibliographic_citation || String.new
    item.bibliographic_citation = bibli_citation + " Available from [" + "http://ezid.cdlib.org/id/#{doi}" + "]"
    item.save
  end
end
