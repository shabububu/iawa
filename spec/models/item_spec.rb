# Generated via
#  `rails generate curation_concerns:work Item`
describe Item do

  describe "#validates_with" do
    before { subject.title = nil }
    it "ensures the item has a title" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:title]).to eq(["Your item must have a title."])
    end

    before { subject.rights = nil }
    it "ensures the item has a right" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:rights]).to eq(["Your item must have a right."])
    end

    before { subject.identifier = nil }
    it "ensures the item has an identifier" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:identifier]).to eq(["Your item must have an identifier."])
    end

    before { subject.rights_holder = nil }
    it "ensures the item has a rights holder" do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:rights_holder]).to eq(["Your item must have a rights holder."])
    end
  end

  describe ".properties" do
    subject { described_class.properties.keys }
    it { is_expected.to include("subject", "part_of", 
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
      subject.rights_holder = ['foo', 'bar']
      expect(subject.rights_holder).to eq ['foo', 'bar']
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
      expect(subject).to respond_to(:date_created)
      expect(subject).to respond_to(:rights)
      expect(subject).to respond_to(:language)
      expect(subject).to respond_to(:resource_type)
      expect(subject).to respond_to(:identifier)
      expect(subject).to respond_to(:part_of)
      expect(subject).to respond_to(:medium)
      expect(subject).to respond_to(:bibliographic_citation)
      expect(subject).to respond_to(:rights_holder)
      expect(subject).to respond_to(:tags)
      expect(subject).to respond_to(:format)
    end
  end
end
