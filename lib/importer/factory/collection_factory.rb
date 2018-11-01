module Importer
  module Factory
    class CollectionFactory < ObjectFactory
      self.klass = Collection

      def update
        raise "Collection doesn't exist" unless object
        object.attributes = update_attributes
        run_callbacks(:save) do
          object.save!
        end
        log_updated(object)
      end

      private
        def transform_attributes
          attributes.merge(type_gid_attributes).merge(collection_membership_attributes)
        end

        def type_gid_attributes
          { collection_type_gid: "gid://iawa/hyrax-collectiontype/1"}
        end

        def collection_membership_attributes
          collection_ids.present? ? { member_of_collections: collection_ids.map {|id| Collection.find(id) } } : {}
      end
    end
  end
end
