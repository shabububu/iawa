# Generated via
#  `rails generate hyrax:work Item`
require 'rails_helper'
include Warden::Test::Helpers

# NOTE: If you generated more than one work, you have to set "js: true"
RSpec.feature 'Create a Item', js: false do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test@example.com', provider: 'cas', uid: 'uid' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      # TODO: uncomment the following once we have a better idea of how these are supposed to work.
      #AdminSet.find_or_create_default_admin_set_id
      #login_as user
    end

    scenario do
      skip "TODO"
      # TODO: uncomment scenario once we understand better how to test features
      #       permissions may be an issue with the cache and db depending which user
      #       is running `bundle exec rspec`

=begin
      visit '/dashboard'
      click_link "Works"
      click_link "Add new work"

      # If you generate more than one work uncomment these lines
      # choose "payload_concern", option: "Item"
      # click_button "Create work"

      expect(page).to have_content "Add New Item"
=end
    end
  end
end
