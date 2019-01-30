require 'rails_helper'

RSpec.describe "controlled_vocabs/new", type: :view do
  before(:each) do
    @field_names = assign(:field_names, [["test_sim", "test"]])
    assign(:controlled_vocab, ControlledVocab.new(
      :field => "MyField",
      :name => "MyName",
      :image_filename => "MyImageFilename"
    ))
  end

  it "renders new controlled_vocab form" do
    render
    expect(rendered).to include 'test_sim'
    expect(rendered).to include 'test'
    expect(rendered).to include 'MyName'
    expect(rendered).to include 'MyImageFilename'

    skip "TODO"
    # TODO: Figure out what this is supposed to do and put it back again later. 
    #assert_select "form[action=?][method=?]", controlled_vocabs_path, "post" do
    #  assert_select "input#controlled_vocab_field[name=?]", "controlled_vocab[field]"
    #  assert_select "input#controlled_vocab_name[name=?]", "controlled_vocab[name]"
    #  assert_select "input#controlled_vocab_image_filename[name=?]", "controlled_vocab[image_filename]"
    #end
  end
end
