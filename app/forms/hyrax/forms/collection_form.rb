module Hyrax
  module Forms
    class CollectionForm
      include HydraEditor::Form

      delegate :id, to: :model

      # TODO: remove this when https://github.com/projecthydra/hydra-editor/pull/115
      # is merged and hydra-editor 3.0.0 is released
      delegate :model_name, to: :model

      self.model_class = ::Collection

      delegate :human_readable_type, :member_ids, to: :model

      self.terms = [:resource_type, :title, :creator, :description,
                    :rights, :date_created, :language,
                    :representative_id, :thumbnail_id, :identifier,
                    :visibility, :source, :bibliographic_citation, 
                    :rights_holder, :coverage]

      self.required_fields = [:title, :rights, :identifier, :rights_holder]

      # @return [Hash] All FileSets in the collection, file.to_s is the key, file.id is the value
      def select_files
        Hash[all_files]
      end

      def primary_terms
        [:title, :description, :creator, :source, :date_created, :rights,
         :language, :identifier, :bibliographic_citation, :rights_holder,
         :coverage, :subject]
      end

      def secondary_terms
        []
      end

      private

        def all_files
          member_presenters.flat_map(&:file_set_presenters).map { |x| [x.to_s, x.id] }
        end

        def member_presenters
          PresenterFactory.build_presenters(model.member_ids, WorkShowPresenter, nil)
        end
    end
  end
end
