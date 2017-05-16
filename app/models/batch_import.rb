class BatchImport
  include ActiveModel::Model
  attr_accessor :file
  attr_accessor :depositor

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
        item = Item.where(identifier: row['Digital Object ID']).first || Item.new
        item.attributes = processRow(row)
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
        when 'Digital Object ID'
          itemHash['identifier'] = field
        when 'Date'
          itemHash['date'] = field
        when 'Type'
          key = 'resource_type'
          itemHash[key] = pushToArray(itemHash[key], field)
        when 'Is Part Of'
          key = 'part_of'
          itemHash[key] = pushToArray(itemHash[key], field)
        when 'Rights'
          itemHash['rights'] = field
        when 'Rights Holder'
          itemHash['rights_holder'] = field
        when 'Bibliographic Citation'
          itemHash['bibliographic_citation'] = field
        else
          key = header.downcase
          itemHash[key] = pushToArray(itemHash[key], field)
        end
      end
    end
    itemHash
  end

  def pushToArray(fieldArray, field)
    fieldArray ||= Array.new
    fieldArray << field
  end
end
