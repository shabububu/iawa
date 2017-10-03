module Hyrax
  class CollectionsController < ApplicationController
    include CollectionsControllerBehavior
    include BreadcrumbsForCollections

    skip_load_and_authorize_resource :only => [:export_csv, :batch_export]

    def export_csv
      @collection = Collection.find(params[:id])
      title = @collection.title.first.gsub(/[^0-9a-z]/i, '_')
      fname = "#{title}-#{Date.today}.csv"
      respond_to do |format|
        format.csv {
          send_data @collection.export_csv, :disposition => "attachment; filename=#{fname}"}
      end
    end

    def batch_export
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
