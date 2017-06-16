class AssignDoiJob < ActiveJob::Base
  attr_accessor :work_id
  attr_accessor :base_url
  queue_as :assign_doi

  def perform(work_id, base_url)
    work = Item.find(work_id)
    minted_doi = Ezid::Identifier.mint(
      target: "#{base_url}/concern/items/#{work_id}",
      datacite_creator: (work.creator.empty? ? "" : work.creator.first), 
      datacite_resourcetype: "Collection",
      datacite_title: work.title.first,
      datacite_publisher: "Special Collections, University Libraries, Virginia Tech",
      datacite_publicationyear: (work.date.empty? ? "" : work.date)
     )
    doi = minted_doi.id
    id_array = work.identifier.to_a << doi
    work.identifier = id_array
    bibli_citation = work.bibliographic_citation || String.new
    work.bibliographic_citation = bibli_citation + " Available from [" + "http://ezid.cdlib.org/id/#{doi}" + "]"
    work.save
  end
end
