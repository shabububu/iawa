module Importer
  # Import a csv file with one work per row. The first row of the csv should be a
  # header row.
  class CSVImporter

    attr_reader :manifest_file, :files_directory, :depositor, :collection_id

    def initialize(manifest_file, files_directory, depositor, collection_id)
      @manifest_file = manifest_file
      @files_directory = files_directory
      @depositor = depositor
      @collection_id = collection_id
    end

    # @return [Integer] count of objects created
    def import_all
      count = 0
      files_dir_array = Dir.glob(files_directory + "/**/Access")
      parser.each do |attributes|
        attrs = attributes.merge(deposit_attributes).merge(visibility_attributes)
        obj_id = attrs[:identifier].first
        obj_file_dir = files_dir_array.detect { |f_d| f_d.end_with?(obj_id + "/Access") }
        parent_collection_id = collection_id
        unless obj_file_dir.nil?
          sub_collection_array = obj_file_dir.sub(BatchImport.basepath+'/','').sub(obj_id+"/Access", '').split('/').drop(1)
          parent_collection_id = create_sub_collections(sub_collection_array, parent_collection_id) unless sub_collection_array.empty?
        end
        create_fedora_objects(attrs, obj_file_dir, parent_collection_id)
        count += 1
      end
      count
    end

    private
      def create_sub_collections(sub_collection_array, collection_id)
        parent_collection_id = collection_id
        parent_collection = Collection.find(collection_id)
        parent_identifier = parent_collection.identifier.first
        parent_title = parent_collection.title.first
        sub_collection_array.each do |sub_col|
          sub_title = parent_title + " || " + sub_col
          sub_identifier = parent_identifier + "_" + sub_col
          unless collection = Collection.where(identifier: sub_identifier).first
            factory_class = ::Importer::Factory.for("Collection")
            attributes = {title: [sub_title], identifier: [sub_identifier]}.merge(deposit_attributes).merge(visibility_attributes)
            f = factory_class.new(attributes, nil, parent_collection_id)
            collection = f.run
          end
          parent_collection_id = collection.id
          parent_identifier = collection.identifier.first
          parent_title = collection.title.first
        end
        return parent_collection_id
      end

      def deposit_attributes
        { depositor: depositor }
      end

      def visibility_attributes
        { visibility: "open" }
      end

      def parser
        CSVParser.new(manifest_file)
      end

      # Build a factory to create the objects in fedora.
      # @param [Hash<Symbol => String>] attributes
      def create_fedora_objects(attributes, files_directory, collection_id)
        factory_class = ::Importer::Factory.for("Item")
        f = factory_class.new(attributes, files_directory, collection_id)
        f.run
      end
  end
end
