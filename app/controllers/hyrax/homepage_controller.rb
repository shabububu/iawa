class Hyrax::HomepageController < ApplicationController
  include Hyrax::HomepageControllerBehavior

  def index
    super
    # load carousel images in order from config
    @images = Rails.configuration.carousel_images.map { |img| 'vtul/carousel/' + img }
    @params = params
  end
end
