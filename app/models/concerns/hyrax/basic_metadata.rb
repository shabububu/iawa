# Overrides Hyrax Gem 2.0.0 
#   hyrax/app/models/concerns/hyrax/basic_metadata.rb

module Hyrax
  module BasicMetadata
    extend ActiveSupport::Concern

    included do
      property :label, predicate: ActiveFedora::RDF::Fcrepo::Model.downloadFilename, multiple: false

      property :relative_path, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#relativePath'), multiple: false

      property :import_url, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#importUrl'), multiple: false do |index|
        index.as :symbol
      end

      property :part_of, predicate: ::RDF::Vocab::DC.isPartOf do |index|
        index.as :stored_searchable, :facetable
      end

      property :resource_type, predicate: ::RDF::Vocab::DC11.type do |index|
        index.as :stored_searchable, :facetable
      end
      property :creator, predicate: ::RDF::Vocab::DC11.creator do |index|
        index.as :stored_searchable, :facetable
      end
      property :contributor, predicate: ::RDF::Vocab::DC11.contributor do |index|
        index.as :stored_searchable, :facetable
      end

      # TODO Ideally, we would just remove the keyword property, but to do so needs more 
      #      investigation.
      #
      # NOTE 2018-05-24: :keyword put back in after upgrade to Hyrax 2.0.0
      #                  Removing it caused errors that were difficult to trace
      #      2018-05-25: The predicate has been changed from DC11.relation
      #                  to DC.relation so that it does not interfere with the
      #                  :tags property
      # 
      #                  Debugging notes - When the ItemActor's
      #                  apply_save_data_to_curation_concern(env) is called,
      #                  env.attributes.keyword exists, 
      #                  but env.curation_concern.attributes.keyword does not.
      #                  The resulting error is something like the following:
      #                    *** NoMethodError Exception: undefined method `keyword' for #<Hash:0x00007f6e827a9700>
      #                  This will take some time to figure out.
      #                  For now, we'll go with the approach of renaming the predicate.
      #                  We do not plan to use the keyword property.
      property :keyword, predicate: ::RDF::Vocab::DC.relation

      property :description, predicate: ::RDF::Vocab::DC11.description do |index|
        index.type :text
        index.as :stored_searchable
      end
      property :tags, predicate: ::RDF::Vocab::DC11.relation do |index|
        index.as :stored_searchable, :facetable
      end

      # Keyword Property removed

      # Used for a license - for the IAWA project, this will be relabeled to "Rights"
      property :license, predicate: ::RDF::Vocab::DC.rights , multiple: false do |index|
        index.as :stored_searchable
      end
      # This is for the rights statement
      property :rights_statement, predicate: ::RDF::Vocab::EDM.rights, multiple:false do |index|
        index.as :stored_searchable
      end
      property :publisher, predicate: ::RDF::Vocab::DC11.publisher do |index|
        index.as :stored_searchable, :facetable
      end
      property :date_created, predicate: ::RDF::Vocab::DC.created, multiple: false do |index|
        index.as :stored_searchable, :stored_sortable
      end
      property :date, predicate: ::RDF::Vocab::DC11.date, multiple: false do |index|
        index.as :stored_searchable
      end
      property :subject, predicate: ::RDF::Vocab::DC11.subject do |index|
        index.as :stored_searchable, :facetable
      end
      property :language, predicate: ::RDF::Vocab::DC11.language do |index|
        index.as :stored_searchable, :facetable
      end
      property :identifier, predicate: ::RDF::Vocab::DC11.identifier do |index|
        index.as :stored_searchable
      end
      property :based_near, predicate: ::RDF::Vocab::FOAF.based_near do |index|
        index.as :stored_searchable, :facetable
      end
      property :related_url, predicate: ::RDF::RDFS.seeAlso do |index|
        index.as :stored_searchable
      end
      property :bibliographic_citation, predicate: ::RDF::Vocab::DC.bibliographicCitation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :coverage, predicate: ::RDF::Vocab::DC11.coverage do |index|
        index.as :stored_searchable, :facetable
      end
      property :source, predicate: ::RDF::Vocab::DC11.source do |index|
        index.as :stored_searchable
      end
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder, multiple: false do |index|
        index.as :stored_searchable
      end
 
      id_blank = proc { |attributes| attributes[:id].blank? }

      class_attribute :controlled_properties
      self.controlled_properties = [:based_near]
      accepts_nested_attributes_for :based_near, reject_if: id_blank, allow_destroy: true
    end
  end
end

