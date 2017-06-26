# Generated via
#  `rails generate curation_concerns:work Item`
class Item < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include Iawa::Metadata
  include Sufia::WorkBehavior

  before_create :auto_fill_fields

  self.human_readable_type = 'Item'
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your item must have a title.' }
  #validates :rights, presence: { message: 'Your item must have a right.' }
  validates :identifier, presence: { message: 'Your item must have an identifier.' }
  #validates :rights_holder, presence: { message: 'Your item must have a rights holder.' }

  property :medium, predicate: ::RDF::Vocab::DC.medium do |index|
    index.as :stored_searchable, :facetable
  end
  property :tags, predicate: ::RDF::Vocab::DC11.subject do |index|
    index.as :stored_searchable, :facetable
  end
  property :format, predicate: ::RDF::Vocab::DC11.format do |index|
    index.as :stored_searchable
  end

  private

    def auto_fill_fields
      rights_statement = "Permission to publish material from the "
      rights_statement += self.title[0] || String.new
      rights_statement += " must be obtained from University Libraries Special Collections, Virginia Tech."
      self.rights = rights_statement
      self.rights_holder = "Special Collections, University Libraries, Virginia Tech"
      bibli_citation = "Researchers wishing to cite this collection should include the following information: - Special Collections, Virginia Polytechnic Institute and State University, Blacksburg, Va."
      self.bibliographic_citation = bibli_citation
    end

end
