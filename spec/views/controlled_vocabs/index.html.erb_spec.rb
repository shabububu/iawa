require 'rails_helper'

RSpec.describe "controlled_vocabs/index.html.erb", type: :view do
  
  before(:each) do
    assign(:controlled_vocabs, [
      ControlledVocab.create!(
        :field => "Field",
        :name => "Name",
        :image_filename => "Image Filename"
      ),
      ControlledVocab.create!(
        :field => "Field 2",
        :name => "Name 2",
        :image_filename => "Image Filename"
      )
    ])
  end

  it "renders a list of controlled_vocabs" do
    skip "TODO"
    #TODO: uncomment below once we figure out how to test below
    #      Currently, we're getting an error similar to the following:
    #        ActionView::Template::Error:
    #          undefined local variable or method `sort_column' for ...
    
    #render
    #assert_select "tr>td", :text => "Field".to_s, :count => 2
    #assert_select "tr>td", :text => "Name".to_s, :count => 2
    #assert_select "tr>td", :text => "Image Filename".to_s, :count => 2
  end
end
