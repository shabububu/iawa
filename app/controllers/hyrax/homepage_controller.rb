class Hyrax::HomepageController < ApplicationController
  include Hyrax::HomepageControllerBehavior

  def index
    super
    # load carousel images 
    images = Dir.entries(Rails.root.join('app', 'assets', 'images', 'vtul', 'carousel')).select {|f| !File.directory? f}
    @images = images.shuffle[0..(images.length)].map { |img| 'vtul/carousel/' + img.to_s }
     
  end
end
