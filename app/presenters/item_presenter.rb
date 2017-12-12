class ItemPresenter < Hyrax::WorkShowPresenter
  delegate :tags, :date, :coverage, :location, :medium, :bibliographic_citation,
           :rights_holder, :format, :contributor, to: :solr_document

  Hyrax::MemberPresenterFactory.file_presenter_class = FileSetPresenter

  def manifest_url
    manifest_helper.polymorphic_url([:manifest, self])
  end

  private

    def manifest_helper
      @manifest_helper ||= ManifestHelper.new(request.base_url)
    end
end
