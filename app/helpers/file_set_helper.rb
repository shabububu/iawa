module FileSetHelper
  include CurationConcerns::FileSetHelper

  def present_terms(presenter, terms = :all, &block)
    terms = presenter.terms if terms == :all
    Sufia::PresenterRenderer.new(presenter, self).fields(terms, &block)
  end
  
  def media_display_full(presenter, locals = {})
    render media_display_partial_full(presenter),
           locals.merge(file_set: presenter)
  end

  def media_display_partial_full(file_set)
    'curation_concerns/file_sets/media_display/' +
      if file_set.image?
        'image_full'
      elsif file_set.video?
        'video'
      elsif file_set.audio?
        'audio'
      elsif file_set.pdf?
        'pdf'
      elsif file_set.office_document?
        'office_document'
      else
        'default'
      end
  end
end
