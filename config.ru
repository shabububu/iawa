# This file is used by Rack-based servers to start the application.
require_relative 'app/middleware/multipart_buffer_setter'
require_relative 'config/environment'

run Rails.application
