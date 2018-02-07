class ItemPresenter < Hyrax::WorkShowPresenter
  delegate :tags, :date, :coverage, :location, :medium, :bibliographic_citation,
           :rights_holder, :format, :contributor, to: :solr_document

  Hyrax::MemberPresenterFactory.file_presenter_class = FileSetPresenter

  def attribute_to_html(field, options = {})
    unless respond_to?(field)
      Rails.logger.warn("#{self.class} attempted to render #{field}, but no method exists with that name.")
      return
    end
    if :date == field.to_sym
      value = send(:date_created)
      value += " - #{send(field)}" unless send(field).nil?
      renderer_for(field, options).new(field, value, options).render
    else
      renderer_for(field, options).new(field, send(field), options).render
    end
  end

  def file_set_presenters
    ((super || []) rescue []).sort_by {|fs| fs.title.first}
  end

  def manifest_url
    manifest_helper.polymorphic_url([:manifest, self])
  end

  private

    def manifest_helper
      @manifest_helper ||= ManifestHelper.new(request.base_url)
    end
end
