class CollectionsController < ApplicationController
  include CurationConcerns::CollectionsControllerBehavior
  include Sufia::CollectionsControllerBehavior

  def presenter_class
    ::CollectionPresenter
  end

  def form_class
    ::CollectionForm
  end
end
