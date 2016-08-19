class Sufia::HomepageController < ApplicationController
  include Sufia::HomepageControllerBehavior
  
  def index
    super
    @images = Pathname.glob(Rails.root.join('app/assets/images/carousel/*.[Jj][Pp][Gg]')).shuffle[0..3]
    @images.map! { |img| img.relative_path_from(Rails.root.join('app/assets/images')).to_s }
    (@response, @document_list) = search_results(params)
  end
  
end
