# Generated via
#  `rails generate hyrax:work Item`
require 'rails_helper'

RSpec.describe Item do

  describe "#validates" do
    it "is valid with a title, identifier and default right, right holder" do
      subject.title = ["test title"]
      subject.identifier = ["test identifier"]
      expect(subject).to be_valid
      expect(subject.license).to eq("Permission to publish material from the test title must be obtained from University Libraries Special Collections, Virginia Tech.")
      expect(subject.rights_holder).to eq("Special Collections, University Libraries, Virginia Tech")
    end

    it "is invalid without a title" do
      subject.title = []
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:title]).to eq(["Your item must have a title."])
    end

    it "is invalid without an identifier" do
      subject.identifier = []
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:identifier]).to eq(["Your item must have an identifier."])
    end
  end

  describe ".properties" do
    subject { described_class.properties.keys }
    it { is_expected.to include("resource_type", "creator", "contributor", "keyword", "description", "tags", "license", "rights_statement",
                                "publisher", "date_created", "date", "subject", "language", "identifier", "related_url", "bibliographic_citation",
                                "coverage", "source", "rights_holder", "medium", "format", "location") }
  end

  # test multi-valued and single-valued newly defined fields
  describe "primary metadata" do
    it "has dc tags property" do
      subject.tags = ['foo', 'bar']
      expect(subject.tags).to eq ['foo', 'bar']
    end
    it "has dc date property" do
      subject.date = 'foo'
      expect(subject.date).to eq 'foo'
    end
    it "has dc coverage property" do
      subject.coverage = ['foo', 'bar']
      expect(subject.coverage).to eq ['foo', 'bar']
    end
    it "has dc rights holder property" do
      subject.rights_holder = 'foo'
      expect(subject.rights_holder).to eq 'foo'
    end
    it "has dc medium property" do
      subject.medium = ['foo', 'bar']
      expect(subject.medium).to eq ['foo', 'bar']
    end
    it "has dc format property" do
      subject.format = ['foo', 'bar']
      expect(subject.format).to eq ['foo', 'bar']
    end
    it "has dc location property" do
      subject.location = ['foo', 'bar']
      expect(subject.location).to eq ['foo', 'bar']
    end
  end

  describe "metadata" do
    it "has descriptive metadata" do
      expect(subject).to respond_to(:depositor)
      expect(subject).to respond_to(:title)
      expect(subject).to respond_to(:medium)
      expect(subject).to respond_to(:format)
      expect(subject).to respond_to(:location)
      expect(subject).to respond_to(:resource_type)
      expect(subject).to respond_to(:creator)
      expect(subject).to respond_to(:contributor)
      expect(subject).to respond_to(:keyword)
      expect(subject).to respond_to(:description)
      expect(subject).to respond_to(:tags)
      expect(subject).to respond_to(:license)
      expect(subject).to respond_to(:date_created)
      expect(subject).to respond_to(:date)
      expect(subject).to respond_to(:subject)
      expect(subject).to respond_to(:language)
      expect(subject).to respond_to(:identifier)
      expect(subject).to respond_to(:related_url)
      expect(subject).to respond_to(:bibliographic_citation)
      expect(subject).to respond_to(:coverage)
      expect(subject).to respond_to(:source)
      expect(subject).to respond_to(:rights_holder)
    end
  end
end
