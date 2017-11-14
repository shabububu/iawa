class BatchImportsController < ApplicationController
  
  def new
    authenticate_user!
    @batch_import = BatchImport.new
  end
    
  def create
    authenticate_user!
    @batch_import = BatchImport.new(params[:batch_import].merge(depositor: current_user.user_key, base_url: request.base_url))
    if @batch_import.save
      flash[:notice] = t('sufia.batch_import.new.after_import_html', 
                       application_name: view_context.application_name)
      redirect_to hyrax.dashboard_works_path
    else
      render :new
    end
  end
end
