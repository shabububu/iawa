class CollectionsController < ApplicationController
  include CurationConcerns::CollectionsControllerBehavior
  include Sufia::CollectionsControllerBehavior

  skip_load_and_authorize_resource :only => [:export_csv]

  def presenter_class
    ::CollectionPresenter
  end

  def form_class
    ::CollectionForm
  end

  def export_csv
    @collection = Collection.find(params[:id])
    title = @collection.title.first.gsub(/[^0-9a-z]/i, '_')
    fname = "#{title}-#{Date.today}.csv"
    respond_to do |format|
      format.csv {
        send_data @collection.export_csv, :disposition => "attachment; filename=#{fname}" }
    end
  end
  # Will be used temporarily for fixing the rights and bibliographic_citation metadata
  def update_rights
    @collection = Collection.find(params[:id])
    title = @collection[:title].first
    rights_first_part = "Permission to publish material from the "
    rights_second_part = " - must be obtained from University Libraries Special Collections, Virginia Tech."
    b_c_first_part = "Researchers wishing to cite this collection should include the following information: "
    b_c_second_part = " - Special Collections, Virginia Polytechnic Institute and State University, Blacksburg, Va. Available from [DOI]"
    rights = rights_first_part + title.sub("The ", "") + rights_second_part
    bibliographic_citation = b_c_first_part + title.sub("The ", "") + b_c_second_part
    @collection.update_attributes({:rights => rights, :bibliographic_citation => bibliographic_citation})
    @collection.members.each do |item|
      item.update_attributes({:rights => rights, :bibliographic_citation => bibliographic_citation})
    end
    after_update
  end    
end
