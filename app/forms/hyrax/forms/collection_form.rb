# Modified based on Hyrax Gem 2.0.0

module Hyrax
  module Forms
    class CollectionForm
      include HydraEditor::Form
      include HydraEditor::Form::Permissions
      # Used by the search builder
      attr_accessor :current_ability, :repository

      delegate :id, :depositor, :permissions, to: :model

      # Required for search builder (FIXME)
      alias collection model

      self.model_class = ::Collection
      class_attribute :member_search_builder_class
      self.member_search_builder_class = Hyrax::CollectionMemberSearchBuilder
      delegate :blacklight_config, to: Hyrax::CollectionsController

      delegate :human_readable_type, :member_ids, to: :model

      self.terms = [:resource_type, :title, :creator, :description,
                    :license, :date_created, :date, :language,
                    :representative_id, :thumbnail_id, :identifier,
                    :visibility, :source, :bibliographic_citation, 
                    :rights_holder, :coverage]

      self.required_fields = [:title, :license, :identifier, :rights_holder]

      # @param model [Collection] the collection model that backs this form
      # @param current_ability [Ability] the capabilities of the current user
      # @param repository [Blacklight::Solr::Repository] the solr repository
      def initialize(model, current_ability, repository)
        super(model)
        @current_ability = current_ability
        @repository = repository
      end

      # @return [Hash] All FileSets in the collection, file.to_s is the key, file.id is the value
      def select_files
        Hash[all_files_with_access]
      end

      def primary_terms
        [:title, :description, :creator, :source, :date_created, :date, :license,
         :language, :identifier, :bibliographic_citation, :rights_holder,
         :coverage, :subject]
      end

      def secondary_terms
        []
      end

      # Do not display additional fields if there are no secondary terms
      # @return [Boolean] display additional fields on the form?
      def display_additional_fields?
        secondary_terms.any?
      end

      def thumbnail_title
        return unless model.thumbnail
        model.thumbnail.title.first
      end

      private

        def all_files_with_access
          member_presenters(member_work_ids).flat_map(&:file_set_presenters).map { |x| [x.to_s, x.id] }
        end

        # Override this method if you have a different way of getting the member's ids
        def member_work_ids
          response = repository.search(member_search_builder.merge(fl: 'id').query).response
          response.fetch('docs').map { |doc| doc['id'] }
        end

        def member_search_builder
          @member_search_builder ||= member_search_builder_class.new(self)
        end

        def member_presenters(member_ids)
          PresenterFactory.build_for(ids: member_ids,
                                     presenter_class: WorkShowPresenter,
                                     presenter_args: [nil])
        end
    end
  end
end
