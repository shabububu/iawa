# Generated via
#  `rails generate hyrax:work Item`
module Hyrax
  module Actors
    class ItemActor < Hyrax::Actors::BaseActor
      protected

        def apply_save_data_to_curation_concern(env)
          env.attributes[:title] = Array(env.attributes[:title]) if env.attributes.key? :title
          remove_blank_attributes!(env.attributes)
          env.curation_concern.date_modified = TimeService.time_in_utc
          env.curation_concern.attributes = env.attributes
          #env.curation_concern.attributes = clean_attributes(env.attributes)
          # update rights (a.k.a. license) and bibliographic_citation using the collection's title
          collection_ids = env.curation_concern.in_collection_ids
          unless collection_ids.empty?
            collection = ::Collection.find(collection_ids.first)
            env.curation_concern.license = collection.license
            env.curation_concern.bibliographic_citation = collection.bibliographic_citation
          end
        end
    end
  end
end
