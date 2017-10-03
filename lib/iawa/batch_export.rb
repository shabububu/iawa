class BatchExport

  attr_accessor :model_name, :class_name

  def initialize(time_stamp)
    @@csv_dir = File.join(Rails.root, 'tmp', 'downloads')
    @time_stamp = time_stamp
    @archive_name = "#{time_stamp}_iawa_export"
  end


  def make_export_dir
    begin
      FileUtils.rm_rf(Dir.glob("#{@@csv_dir}/*"))
    rescue
      puts 'Error clearing csv dir'
    end
    export_path = File.join(@@csv_dir, "#{time.now}_iawa_export")
    FileUtils::mkdir_p(archive_full_path)
  end

  def export_metadata model_name
    @model_name = model_name
    items = get_items_for_model.map { |item| item["id"] }
    file_path = File.join(@@csv_dir, @archive_name, "#{model_name.downcase}.csv")
    write_csv(file_path, model_name.constantize, items) 
  end

  def export_metadata_with_files(collection_id, base_url)
    collection_file_path = File.join(@@csv_dir, @archive_name, "collection_#{collection_id}.csv")
    write_csv(collection_file_path, Collection, [collection_id])
    item_ids = Collection.find(collection_id).member_ids
    unless item_ids.blank?
      file_path = File.join(@@csv_dir, @archive_name, "collection_#{collection_id}_items.csv")
      write_csv(file_path, Item, item_ids)
      add_files(item_ids, base_url)
    end
  end

  def zip
    archive_full_path = File.join(@@csv_dir, @archive_name)
    zip_file_path = "#{archive_full_path}.zip"
    Dir.chdir archive_full_path
    files_to_archive = Dir['**/*'].reject { |fn| File.directory?(fn) }

    archive = Archive::Compress.new(zip_file_path, :type => :zip)
    archive.compress(files_to_archive)
    
    return zip_file_path
  end

  private
  
    def get_all_items_for_model
      query = ActiveFedora::SolrQueryBuilder.construct_query_for_rel(has_model: model_name)
      ActiveFedora::SolrService.query(query)
    end

    def add_files item_ids, base_url
      item_ids.each do |item_id|
        item = Item.find(item_id)
        item_target_path = File.join(@archive_full_path, item.filename)
        # If a file already exists with this filename then put this one in a sub-dir named after the item id
        if File.file? item_target_path
          FileUtils::mkdir_p(File.join(@archive_full_path, item_id))
          item_target_path = File.join(@archive_full_path, item_id, item.filename)
        end
        File.open(item_target_path, 'wb' { |file| file.write(item.content.content) }
      end
    end

    def write_csv file_path, item_class, item_ids
      CSV.open(file_path, 'wb') do |csv|
        csv << item_class.new.csv_headers
        item_ids.each do |item_id|
          item = item_class.fin(item_id)
          csv << item.csv_values
        end
      end
    end
end
