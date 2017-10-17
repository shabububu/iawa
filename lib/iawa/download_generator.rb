class DownloadGenerator
  require 'fileutils'

  attr_accessor :model_name, :my_class, :timestamp, :archive_name, :archive_full_path

  def initialize(time_stamp)
    @timestamp = time_stamp
    @archive_name = "#{timestamp}_vtechdata_export"
    @archive_full_path = File.join(self.class.csv_dir, archive_name)
  end

  def self.csv_dir
    File.join(Rails.root, 'tmp', 'downloads')
  end

  def self.clear_csv_dir
    begin
      FileUtils.rm_rf(Dir.glob("#{csv_dir}/*"))
    rescue
      puts 'error clearing csv dir'
    end
  end

  def make_archive
    self.class.clear_csv_dir
    FileUtils::mkdir_p(archive_full_path)
  end

  def export_all_metadata(class_name)
    @model_name = class_name
    @my_class = class_name.constantize
    items = get_all_items_for_model.map{ |item| item["id"] }
    file_path = File.join(self.class.csv_dir, archive_name, "#{timestamp}_#{model_name.downcase}.csv")
    write_csv(file_path, my_class, items)
  end

  def download_collection(collection_id)
    collection_file_path = File.join(self.class.csv_dir, archive_name, "collection_#{collection_id}.csv")
    write_csv(collection_file_path, Collection, [collection_id])
    collection_item_ids = Collection.find(collection_id).member_ids
    if !collection_item_ids.blank?
      items_file_path = File.join(self.class.csv_dir, archive_name, "collection_#{collection_id}_items.csv")
      write_csv(items_file_path, Item, collection_item_ids)
      add_files(collection_item_ids)
    end
  end

  def zip
    zip_file = "#{archive_full_path}.zip"
    Dir.chdir archive_full_path
    files_to_archive = Dir['**/*'].reject {|fn| File.directory?(fn) }

    archive = Archive::Compress.new(zip_file, :type => :zip)
    archive.compress(files_to_archive)

    return zip_file
  end

  private

    def get_all_items_for_model
      query = ActiveFedora::SolrQueryBuilder.construct_query_for_rel(has_model: model_name)
      ActiveFedora::SolrService.query(query)
    end

    def add_files item_ids
      item_ids.each do |item_id|
        file_set = FileSet.find(item_id)
        if file_set.filename
          file_set_path = File.join(archive_full_path, file_set.filename)
          # If a file already exists with this filename then put this one in a sub-directory named after the item id
          if File.file? file_set_path
            FileUtils::mkdir_p(File.join(archive_full_path, item_id))
            file_set_path =  File.join(archive_full_path, item_id, file_set.filename)
          end
          File.open(file_set_path, 'wb') { |file| file.write(file_set.content.content) }
        end
      end      
    end

    def write_csv file_path, item_class, item_ids
      CSV.open(file_path,'wb') do |csv|
        headers = item_class.new.csv_headers
        csv << headers
        item_ids.each do |item_id|
          record = item_class.find(item_id)
          values = record.csv_values
          csv << values
        end
      end
    end

end
