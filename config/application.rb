require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iawa
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec, :spec => true
    end

    # The compile method (default in tinymce-rails 4.5.2) doesn't work when also
    # using tinymce-rails-imageupload, so revert to the :copy method
    # https://github.com/spohlenz/tinymce-rails/issues/183
    config.tinymce.install = :copy
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config ActiveJob backend
    config.active_job.queue_adapter = Rails.application.secrets[:active_job_backend]

    config.autoload_paths += %W(#{config.root}/lib) 

    # Overrides
    config.to_prepare do
      # TEMP Solution until LIBTD-1419 is resolved.
      Hyrax::CollectionType.const_set('USER_COLLECTION_DEFAULT_TITLE','User Collection')
      Hyrax::CollectionType.const_set('ADMIN_SET_DEFAULT_TITLE','Admin Set')

      Hyrax::HomepageController.prepend Hyrax::HomepageControllerOverride
      Hyrax::BatchUploadsController.prepend Hyrax::BatchUploadsControllerOverride
      Hyrax::CollectionsController.prepend Hyrax::CollectionsControllerOverride
      Hyrax::Forms::CollectionForm.prepend Hyrax::Forms::CollectionFormOverride
      Hyrax::CollectionPresenter.prepend Hyrax::CollectionPresenterOverride
      Hyrax::FileSetDerivativesService.prepend Hyrax::FileSetDerivativesServiceOverride
    end
  end
end
