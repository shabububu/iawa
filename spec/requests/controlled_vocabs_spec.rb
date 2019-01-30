require 'rails_helper'

RSpec.describe "ControlledVocabs", type: :request do
  describe "GET /controlled_vocabs" do
    it "works! (now write some real specs)" do
      get controlled_vocabs_path

      skip "TODO"
      # TODO: Uncomment the following once we figure out how to enable
      #       cas login with rspec
      #expect(response).to have_http_status(200)
    end
  end
end
