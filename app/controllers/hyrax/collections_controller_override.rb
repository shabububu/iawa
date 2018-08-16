module Hyrax
  module CollectionsControllerOverride

      def self.prepended(base)
        base.skip_load_and_authorize_resource :only => [:export_metadata]
      end


    def export_metadata
      @collection = Collection.find(params[:id])
      title = @collection.title.first.gsub(/[^0-9a-z]/i, '_')
      fname = "#{title}-#{Date.today}.csv"
      respond_to do |format|
        format.csv {
          send_data @collection.export_csv, :disposition => "attachment; filename=#{fname}"}
      end
    end
  end
end
