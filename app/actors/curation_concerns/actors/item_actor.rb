# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  module Actors
    class ItemActor < CurationConcerns::Actors::BaseActor

      protected

      def apply_save_data_to_curation_concern(attributes)
        remove_blank_attributes!(attributes)
        curation_concern.attributes = attributes.symbolize_keys
        curation_concern.date_modified = CurationConcerns::TimeService.time_in_utc
      end
    end
  end
end
