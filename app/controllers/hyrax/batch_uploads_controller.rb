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
    uploaded_files.each do |uploaded_file|
      title = uploaded_file.file.current_path.split('/').last
      file_name = title.split('.')[0]
      id = file_name[0...file_name.rindex('_')]
      item = Item.where(identifier: [id]).first
      unless item.nil? || item.file_sets.any? { |fs| fs.title.first == title }
        AttachFilesToWorkJob.perform_later(item, [uploaded_file])
      end
    end
  end
end
