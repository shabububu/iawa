# Generated via
#  `rails generate hyrax:work ItemSet`
module Hyrax
  class ItemSetForm < Hyrax::Forms::WorkForm
    self.model_class = ::ItemSet
    self.terms -= [:keyword, :files]
    self.required_fields = [:title, :creator]

    def secondary_terms
      terms - primary_terms - 
       [:rights, :visibility_during_embargo, :embargo_release_date,
           :visibility_after_embargo, :visibility_during_lease,
           :lease_expiration_date, :visibility_after_lease, :visibility,
           :thumbnail_id, :representative_id, :ordered_member_ids,
           :member_of_collection_ids, :in_works_ids, :admin_set_id]
    end
  end
end
