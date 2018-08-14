module Hyrax
  module Forms
    module CollectionFormOverride

      def self.prepended(base)
        base.terms = [:resource_type, :title, :creator, :description,
                      :license, :date_created, :date, :language,
                      :representative_id, :thumbnail_id, :identifier,
                      :visibility, :source, :bibliographic_citation,
                      :rights_holder, :coverage, :subject]

        base.required_fields = [:title, :license, :identifier, :rights_holder]
      end

      # Terms that appear above the accordion
      def primary_terms
        [:title, :description, :creator, :source, :date_created, :date, :license,
         :language, :identifier, :bibliographic_citation, :rights_holder,
         :coverage, :subject]
      end

      # Terms that appear within the accordion
      def secondary_terms
        []
      end
    end
  end
end
