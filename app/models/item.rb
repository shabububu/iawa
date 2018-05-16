# Generated via
#  `rails generate hyrax:work Item`
class Item < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  validate :auto_fill_fields, on: :create
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your item must have a title.' }
  validates :rights_statement, presence: { message: 'Your item must have a rights statement.' }
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

  include ::Hyrax::BasicMetadata

  # class setter  
  self.human_readable_type = 'Item'

  def csv_values
    ret_array = []
    collections = self.member_of_collection_ids.join('~')
    ret_array << collections
    ret_array << self.identifier.first
    ret_array << self.title
    ret_array << self.date_range
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
    ret_array << self.rights_statement
    ret_array << self.rights_holder
    ret_array << self.bibliographic_citation
  end

  #############################
  #
  #
  #############################
  def has_file_titled?(title)
    file_sets.any? { |fs| fs.title.first == title }
  end # def has_file_titled?(title)

  private

    def auto_fill_fields
      rights_statement = "Permission to publish material from the "
      rights_statement += self.title.first || String.new
      rights_statement += " must be obtained from University Libraries Special Collections, Virginia Tech."
      self.rights_statement = rights_statement
      self.rights_holder = "Special Collections, University Libraries, Virginia Tech"
      bibli_citation = "Researchers wishing to cite this collection should include the following information: - Special Collections, Virginia Polytechnic Institute and State University, Blacksburg, Va."
      self.bibliographic_citation = bibli_citation
    end
end
