# coding: utf-8
require 'rails_helper'
require 'importer'

RSpec.describe Importer::CSVParser do
  let(:first_record) { subject.first }

  subject { described_class.new(file) }

  context 'parsing metadata file' do
    let(:file) { "#{fixture_path}/importer/manifest_samples/sample.csv" }
    it 'parses a record' do
      expect(first_record[:title].first).to be_a String
      expect(first_record[:title]).to eq ["Résumé for Lorraine Rudoff, n.d. (Ms1990-025)"]
      expect(first_record[:identifier]).to eq ["Ms1990_025_Per_Eph_B001_F001_001"]
      expect(first_record[:date_created]).to eq "Circa 1969"
      expect(first_record[:date]).to eq "1979"
      expect(first_record[:description]).to eq ["Two pins that read U.I.F.A. (L'Union Internationale des Femmes Architectes) and a nametag."]
      expect(first_record[:subject]).to eq ["subject"]
      expect(first_record[:resource_type]).to eq ["Ephemera"]
      expect(first_record[:medium]).to eq ["Photographic Print - Black and White"]
      expect(first_record[:format]).to eq ["8 in. x 10 in.", "20 cm x 25 cm"]
      expect(first_record[:creator]).to eq ["Green, Terence M."]
      expect(first_record[:source]).to eq ['Please consult the <a href="http://search.vaheritage.org/vivaxtf/view?docId=vt/viblbv00682.xml">Guide to the Lorraine Rudoff Architectural Collection</a> for more information.']
      expect(first_record[:coverage]).to eq ["Los Angeles, California"]
      expect(first_record[:language]).to eq ["en"]
      expect(first_record[:location]).to eq ["Ms1990-025, Box 1, Folder 1"]
      expect(first_record[:tags]).to eq ["Industrial", "Commercial and office"]
      expect(first_record.keys).to match_array [:identifier, :title, :date_created, :date, :description, :subject,
                                                :resource_type, :medium, :format, :creator, :source, :location,
                                                :language, :coverage, :tags]
    end
  end

  describe '#headers' do
    let(:file) { "#{fixture_path}/importer/manifest_samples/sample.csv" }
    it {
            expect(subject.headers).to eq(%w(Identifier Title Circa Start\ Date End\ Date Description Subject
        Type Medium Format Creator Source Is\ Part\ Of Language Coverage Tags Related\ URL Contributor))
    }
  end

end
