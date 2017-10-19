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
        unless item.identifier[1]
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
          itemHash['identifier'] = item.identifier
        else
          item = Item.new
        end
        #if collection_id = itemHash.delete(:collection_id) && collection_id != item.collection_id
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
        #when 'Collection Identifier'
         # itemHash['collection_id'] = field
        when 'Circa'
          if field == 'yes'
            itemHash['date_created'] ||= Array.new
            itemHash['date_created'][0] = "Circa "  
          else
            itemHash['date_created'] ||= Array.new
            itemHash['date_created'][0] = ""  
          end
        when 'Start Date'
          itemHash['date_created'] ||= Array.new
          itemHash['date_created'][0] = "" if itemHash['date_created'][0].nil?  
          itemHash['date_created'][1] = field
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
