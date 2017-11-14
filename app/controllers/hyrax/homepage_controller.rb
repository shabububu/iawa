class Hyrax::HomepageController < ApplicationController
  include Hyrax::HomepageControllerBehavior

  def index
    super
    # load carousel images in order from config
    @images = Rails.configuration.carousel_images.map { |img| 'vtul/carousel/' + img }
    (@response, @document_list)  = search_results(params)
  end

  def search_action_path *args
    if args.first.is_a? Hash
      args.first[:only_path] = true if args.first[:only_path].nil?
    end

    search_action_url(*args)
  end

  def search_action_url options = {}
    # Rails 4.2 deprecated url helpers accepting string keys for 'controller' or 'action'
    main_app.search_catalog_url(options.except(:controller, :action))
  end
end
