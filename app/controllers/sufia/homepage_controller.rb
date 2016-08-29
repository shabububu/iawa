class Sufia::HomepageController < ApplicationController
  include Sufia::HomepageControllerBehavior
  
  def index
    super
    # load carousel images in order from config
    @images = Rails.configuration.carousel_images
    (@response, @document_list) = search_results(params)
  end
  
end
