# Generated by hyrax:models
class Collection < ActiveFedora::Base
  include ::Hyrax::CollectionBehavior
  # You can replace these metadata if they're not suitable
  include Hyrax::BasicMetadata
  validates :rights, presence: { message: 'Your collection must have a right.' }
  validates :identifier, presence: { message: 'Your collection must have an identifier.' }
  validates :rights_holder, presence: { message: 'Your collection must have a rights holder.' }

  def export_csv
    headers = ["Digital Object ID", "Title", "Description", "Date", "Language",
               "Coverage", "Type", "Medium", "Format", "Tags", "Is Part Of",
               "Rights", "Rights Holder", "Bibliographic Citation"]
    attributes = %w{identifier title description date language coverage
                    resource_type medium format tags part_of rights 
                    rights_holder bibliographic_citation}
    CSV.generate(headers: true) do |csv|
      csv << headers
      members.each do |item|
        csv << attributes.map do |attr|
          values = item.send(attr)
          values.respond_to?(:to_a) ? values.join("~") : values
        end 
      end
    end
  end
end
