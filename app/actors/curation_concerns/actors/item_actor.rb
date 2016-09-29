# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  module Actors
    class ItemActor < CurationConcerns::Actors::BaseActor

      protected

        def apply_save_data_to_curation_concern(attributes)
          remove_blank_attributes!(attributes)
          attributes.delete(:remote_files) unless curation_concern.attributes[:remote_files]
          attributes.delete(:uploaded_files) unless curation_concern.attributes[:uploaded_files]
          curation_concern.attributes = attributes.symbolize_keys
          curation_concern.date_modified = CurationConcerns::TimeService.time_in_utc
          # update rights and bibliographic_citation using the collection's title
          collection_ids = curation_concern.in_collection_ids
          unless collection_ids.empty?
            collection = ::Collection.find(collection_ids.first)
            curation_concern.rights = collection.rights
            curation_concern.bibliographic_citation = collection.bibliographic_citation
          end
        end
    end
  end
end
