# Generated via
#  `rails generate curation_concerns:work Item`
class Item < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include Sufia::WorkBehavior
  self.human_readable_type = 'Item'
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your item must have a title.' }
  property :coverage, predicate: ::RDF::Vocab::DC11.coverage do |index|
    index.as :stored_searchable
  end
  property :medium, predicate: ::RDF::Vocab::DC.medium do |index|
    index.as :stored_searchable, :facetable
  end
  property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder do |index|
    index.as :stored_searchable
  end
end
