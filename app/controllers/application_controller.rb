class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  include Hydra::Controller::ControllerBehavior

  # Adds Hyrax behaviors into the application controller
  include Hyrax::Controller
  include Hyrax::ThemedLayoutController
  with_themed_layout '1_column'

  # Avoid flash messages being swallowed for XHR requests
  skip_after_action :discard_flash_if_xhr

  protect_from_forgery with: :exception

  def new_session_path(scope)
    new_user_session_path
  end
end
