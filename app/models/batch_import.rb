class BatchImport
  include ActiveModel::Model
  attr_accessor :file, :depositor, :base_url

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_items.map(&:valid?).all?
      imported_items.each {|i| i.visibility = "open" }
      imported_items.each(&:save!)
      imported_items.each do |item|
        unless item.identifier.to_a.any? { |id| /\A#{Ezid::Client.config.default_shoulder}/ =~ id}
          AssignDoiJob.perform_later(item.id, base_url)
        end
      end
      true
    else
      imported_items.each_with_index do |item, idx|
        item.errors.full_messages.each do |message|
          errors.add :base, "Row #{idx+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_items
    @imported_items ||= load_imported_items
  end

  def load_imported_items
    unless File.extname(file.original_filename) == ".csv"
      raise "Unknown file type: #{file.original_filename}"
    else
      imported_items = Array.new
      CSV.foreach(file.path, headers: true) do |row|
        itemHash = processRow(row)
        if item = Item.where(identifier: row['Identifier']).first
          itemHash.delete("identifier")
        else
          item = Item.new
        end
        if collection_id = itemHash.delete("collection_id")
          if collection = Collection.where(identifier: [collection_id]).first
            unless item.member_of_collection_ids.include?(collection.id)
              item.member_of_collections << collection
            end
          end
        end
        # additemtocollection
        item.attributes = itemHash
        item.apply_depositor_metadata(depositor)
        imported_items << item
      end
      imported_items
    end
  end

  def processRow(row)
    itemHash = Hash.new
    row.each do |header, field|
      unless field.blank?
        case header
        when 'Collection Identifier'
          itemHash['collection_id'] = field
        when 'Circa'
          if field == 'yes'
            itemHash['date_created'] = "Circa "  
          end
        when 'Start Date'
          itemHash['date_created'] ||= "" 
          itemHash['date_created'] += field
        when 'End Date'
          itemHash['date'] = field
        when 'Type'
          key = 'resource_type'
          itemHash[key] = field.split('~')
        when 'Is Part Of'
          key = 'location'
          itemHash[key] = field.split('~')
        when 'Related URL'
          itemHash['related_url'] = field.split('~')
        else
          key = header.downcase
          itemHash[key] = field.split('~')
        end
      end
    end
    itemHash
  end
end
