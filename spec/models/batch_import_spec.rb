require 'rails_helper'

RSpec.shared_examples 'an invalid batch import' do
  it 'reports the error' do
    subject.validate
    expect(subject.errors.full_messages).to include(error_msg)
  end
end

RSpec.describe BatchImport do

  describe 'configuration for basepath' do
    describe 'config file exists' do
      let(:basepath) { '/path/from/config/file/' }
      let(:config_file_contents) { "basepath: #{basepath}\n" }
      before do
        allow(File).to receive(:file?).with(described_class::CONFIG_FILE) { true }
        allow(File).to receive(:read).with(described_class::CONFIG_FILE) { config_file_contents }
      end
      it 'uses values from the config file' do
        skip #TODO
        expect(described_class.basepath).to eq(basepath)
      end
    end
    describe 'config file does not exist' do
      before do
        allow(File).to receive(:file?).with(described_class::CONFIG_FILE) { false }
      end
      it 'uses default config values' do
        expect(described_class.basepath).to eq(File.join(Rails.root, 'tmp', 'imports'))
      end
    end
  end

end
