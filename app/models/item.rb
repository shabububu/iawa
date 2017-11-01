# Generated via
#  `rails generate hyrax:work Item`
class Item < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata

  validate :auto_fill_fields, on: :create
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your item must have a title.' }
  validates :rights, presence: { message: 'Your item must have a right.' }
  validates :identifier, presence: { message: 'Your item must have an identifier.' }
  validates :rights_holder, presence: { message: 'Your item must have a rights holder.' }

  property :medium, predicate: ::RDF::Vocab::DC.medium do |index|
    index.as :stored_searchable, :facetable
  end
  property :format, predicate: ::RDF::Vocab::DC11.format do |index|
    index.as :stored_searchable
  end
  property :location, predicate: ::RDF::Vocab::DC.Location do |index|
    index.as :stored_searchable, :facetable
  end

  belongs_to :item_set, predicate: ActiveFedora::RDF::Fcrepo::RelsExt.isPartOf

  # class setter  
  self.human_readable_type = 'Item'

  def csv_headers
    ['Identifier', 'Title', 'Circa' 'Start Date', 'End Date', 'Description', 
     'Subject', 'Type', 'Medium', 'Format', 'Creator', 'Source', 'Is Part Of', 
     'Language', 'Coverage', 'Tags', 'Related URL', 'Contributor', 'In Collections']
  end

  def csv_values
    ret_array = []
    collections = self.collections.map{ |c| c.id }.join('~') rescue ""
    ret_array << self.identifier.first
    ret_array << self.title.first
    ret_array << self.date_created.first
    ret_array << self.date_created[1]
    ret_array << self.date
    ret_array << self.description.join('~')
    ret_array << self.subject.join('~')
    ret_array << self.resource_type.join('~')
    ret_array << self.medium.join('~')
    ret_array << self.format.join('~')
    ret_array << self.creator.join('~')
    ret_array << self.source.join('~')
    ret_array << self.location.join('~')
    ret_array << self.language.join('~')
    ret_array << self.coverage.join('~')
    ret_array << self.tags.join('~')
    ret_array << self.related_url.join('~')
    ret_array << self.contributor('~')
    ret_array << collections
  end

  private

    def auto_fill_fields
      rights_statement = "Permission to publish material from the "
      rights_statement += self.title.first || String.new
      rights_statement += " must be obtained from University Libraries Special Collections, Virginia Tech."
      self.rights = rights_statement
      self.rights_holder = "Special Collections, University Libraries, Virginia Tech"
      bibli_citation = "Researchers wishing to cite this collection should include the following information: - Special Collections, Virginia Polytechnic Institute and State University, Blacksburg, Va."
      self.bibliographic_citation = bibli_citation
    end
end
