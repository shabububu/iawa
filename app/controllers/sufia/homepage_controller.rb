class Sufia::HomepageController < ApplicationController
  include Sufia::HomepageControllerBehavior
  
  def index
    super
    (@response, @document_list) = search_results(params)
  end
  
end
