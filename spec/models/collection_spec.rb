require 'rails_helper'

RSpec.describe Collection do

    describe "#validates_with" do

    before { subject.rights = nil }
    it "ensures the item has a right" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:rights]).to eq(["Your collection must have a right."])
    end

    before { subject.identifier = nil }
    it "ensures the item has an identifier" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:identifier]).to eq(["Your collection must have an identifier."])
    end

    before { subject.rights_holder = nil }
    it "ensures the item has a rights holder" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:rights_holder]).to eq(["Your collection must have a rights holder."])
    end
  end

  describe ".properties" do
    subject { described_class.properties.keys }
    it { is_expected.to include("identifier", "rights_holder", "coverage", "subject") }
  end

  # test multi-valued and single-valued newly defined fields
  describe "primary metadata" do
    it "has dc identifier properties" do
      subject.identifier = ['foo']
      expect(subject.identifier).to eq ['foo']
    end
    it "has dc rights holder properties" do
      subject.rights_holder = ['foo', 'bar']
      expect(subject.rights_holder).to eq ['foo', 'bar']
    end
    it "has dc coverage properties" do
      subject.coverage = ['foo', 'bar']
      expect(subject.coverage).to eq ['foo', 'bar']
    end
    it "has dc subject properties" do
      subject.subject = ['foo', 'bar']
      expect(subject.subject).to eq ['foo', 'bar']
    end
  end

  describe "metadata" do
    it "has descriptive metadata" do
      expect(subject).to respond_to(:title)
      expect(subject).to respond_to(:description)
      expect(subject).to respond_to(:creator)
      expect(subject).to respond_to(:source)
      expect(subject).to respond_to(:date)
      expect(subject).to respond_to(:rights)
      expect(subject).to respond_to(:language)
      expect(subject).to respond_to(:identifier)
      expect(subject).to respond_to(:bibliographic_citation)
      expect(subject).to respond_to(:rights_holder)
      expect(subject).to respond_to(:coverage)
      expect(subject).to respond_to(:subject)
    end
  end
end
