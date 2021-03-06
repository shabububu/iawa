# coding: utf-8
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  # config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # TODO: Fix later. Related to LIBTD-1423 (COMPEL)
  #       Temporarily enable static files from `/public` folder
  #       This is to allow public serving of branding images.
  config.public_file_server.enabled = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  config.active_job.queue_adapter = Rails.application.secrets[:active_job_backend]
  # config.active_job.queue_name_prefix = "binary_arts_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify
  # Logging
  if Rails.application.secrets[:graylog][:enabled] == true
    graylog_settings = Rails.application.secrets[:graylog]
    graylog_host = graylog_settings[:host] || '127.0.0.1'
    graylog_port = graylog_settings[:port] || 12201
    graylog_network_locality = graylog_settings[:network_locality] || :WAN
    graylog_protocol = graylog_settings[:protocol] || 'udp'
    graylog_protocol = graylog_protocol.downcase == 'tcp' ? GELF::Protocol::TCP : GELF::Protocol::UDP
    graylog_facility = graylog_settings[:facility]
    graylog_verbosity = graylog_settings[:verbosity] || 'info'

    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Graylog2.new
    config.logger = GELF::Logger.new(graylog_host, graylog_port,
        graylog_network_locality, { :protocol => graylog_protocol,
                                    :facility => graylog_facility })
    config.log_level = graylog_verbosity
    config.colorize_logging = false
    # Log controller params, too
    config.lograge.custom_options = lambda do |event|
      params = event.payload[:params].reject { |k| %w(controller action).include?(k) }
      { "params" => params }
    end
  else
    # Create a standard logger that writes to log/production.log and rotates them.
    # This ages the logfile once it reaches a certain size. Leave 12 “old” log files where 
    # each file is about 10485760 bytes. See LIBTD-1540 for more information.
    config.logger = Logger.new(Rails.root.join('log', "#{Rails.env}.log"), 12, 10485760)
    config.log_level = :warn
  end
  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
