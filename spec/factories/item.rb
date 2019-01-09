FactoryBot.define do
  factory :item, aliases: [:private_item], class: Item do
    transient do
      user { FactoryBot.create(:user) }
    end

    title ["Test title"]
    visibility Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PRIVATE

    after(:build) do |item, evaluator|
      item.apply_depositor_metadata(evaluator.user.user_key)
    end

    factory :public_item do
      visibility Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC
    end

    factory :registered_item do
      read_groups ["registered"]
    end

    factory :item_with_one_file do
      before(:create) do |item, evaluator|
        item.ordered_members << FactoryBot.create(:file_set, user: evaluator.user, title: ['A Contained FileSet'], label: 'filename.pdf')
      end
    end
  end
end
