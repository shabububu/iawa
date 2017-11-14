class Hyrax::BatchUploadsController < ApplicationController
  include Hyrax::BatchUploadsControllerBehavior

  def create
      authenticate_user!
      create_update_job
      flash[:notice] = t('sufia.works.new.after_attach_html', application_name: view_context.application_name)
      redirect_to sufia.dashboard_works_path
    end

  protected
  
  def create_update_job
    begin
      uploaded_files ||= Sufia::UploadedFile.find(params[:uploaded_files])
    rescue
      uploaded_files = []
    end
    uploaded_files.each do |uploaded_file|
      id = uploaded_file.file.current_path.split('/').last.split('.')[0]
      item = Item.where(identifier: id).first
      AttachFilesToWorkJob.perform_later(item, [uploaded_file])
    end
  end
end
