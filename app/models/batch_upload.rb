class BatchUpload
  include ActiveModel::Model
  
  attr_accessor :files
  
  
  #############################
  #
  #
  #############################
  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
    @files ||= Array.new
  end # def initialize
  

  #############################
  #
  #
  #############################
  def persisted?
    false
  end # def persisted?
  
  
  #############################
  #
  #
  #############################
  def save
    items_with_files = Hash.new
    files.each do |file|
      file_path = file.file.current_path
      title = File.basename(file_path)
      id = File.basename(file_path, "_*")
      item = Item.where(identifier: [id]).first
      # attach file if item lacks file
      unless item.nil? || item.has_file_titled?(title)
        items_with_files[id] ||= Hash.new
        items_with_files[id]["object"] = item
        items_with_files[id]["files"] ||= Array.new
        items_with_files[id]["files"] << file
      end
     end # files.each do |file|
     items_with_files.each do |key, item|
       AttachFilesToWorkJob.perform_later(item["object"], item["files"])
     end
  end # def save
  
  
end # class BatchUpload

