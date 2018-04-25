class Hyrax::BatchUploadsController < ApplicationController
  include Hyrax::BatchUploadsControllerBehavior

  def create
      authenticate_user!
      create_update_job
      flash[:notice] = t('hyrax.works.new.after_attach_html', application_name: view_context.application_name)
      redirect_to hyrax.dashboard_works_path
    end

  protected
  
  def create_update_job
    begin
      uploaded_files ||= Hyrax::UploadedFile.find(params[:uploaded_files])
    rescue
      uploaded_files = []
    end
    batch_upload = BatchUpload.new({files: uploaded_files})
    batch_upload.save
  end
end
