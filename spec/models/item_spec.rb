# Generated via
#  `rails generate hyrax:work Item`
require 'rails_helper'

RSpec.describe Item do

  describe "#validates_with" do
    before { subject.title = nil }
    it "ensures the item has a title" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:title]).to eq(["Your item must have a title."])
    end

    before { subject.license = nil }
    it "ensures the item has a right" do
      expect(subject).not_to be_valid
      expect(subject.license).to eq("Permission to publish material from the  must be obtained from University Libraries Special Collections, Virginia Tech.")
    end

    before { subject.identifier = nil }
    it "ensures the item has an identifier" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:identifier]).to eq(["Your item must have an identifier."])
    end

    before { subject.rights_holder = nil }
    it "ensures the item has a rights holder" do
      expect(subject).not_to be_valid
      expect(subject.rights_holder).to eq("Special Collections, University Libraries, Virginia Tech")
    end
  end

  describe ".properties" do
    subject { described_class.properties.keys }
    it { is_expected.to include("coverage", "part_of", 
      "identifier", "medium", "rights_holder", "tags", "format") }
  end

  # test multi-valued and single-valued newly defined fields
  describe "primary metadata" do
    it "has dc part of properties" do
      subject.part_of = ['foo', 'bar']
      expect(subject.part_of).to eq ['foo', 'bar']
    end
    it "has dc identifier properties" do
      subject.identifier = ['foo']
      expect(subject.identifier).to eq ['foo']
    end
    it "has dc medium properties" do
      subject.medium = ['foo', 'bar']
      expect(subject.medium).to eq ['foo', 'bar']
    end
    it "has dc rights holder properties" do
      subject.rights_holder = 'foo'
      expect(subject.rights_holder).to eq 'foo'
    end
    it "has dc tags properties" do
      subject.tags = ['foo', 'bar']
      expect(subject.tags).to eq ['foo', 'bar']
    end
    it "has dc format properties" do
      subject.format = ['foo', 'bar']
      expect(subject.format).to eq ['foo', 'bar']
    end
  end

  describe "metadata" do
    it "has descriptive metadata" do
      expect(subject).to respond_to(:title)
      expect(subject).to respond_to(:description)
      expect(subject).to respond_to(:creator)
      expect(subject).to respond_to(:source)
      expect(subject).to respond_to(:date)
      expect(subject).to respond_to(:license)
      expect(subject).to respond_to(:language)
      expect(subject).to respond_to(:resource_type)
      expect(subject).to respond_to(:identifier)
      expect(subject).to respond_to(:coverage)
      expect(subject).to respond_to(:part_of)
      expect(subject).to respond_to(:medium)
      expect(subject).to respond_to(:bibliographic_citation)
      expect(subject).to respond_to(:rights_holder)
      expect(subject).to respond_to(:tags)
      expect(subject).to respond_to(:format)
    end
  end
end
