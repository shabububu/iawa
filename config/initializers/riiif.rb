# Tell RIIIF to get files via HTTP (not from the local disk)
Riiif::Image.file_resolver = Riiif::HTTPFileResolver.new

# This tells RIIIF how to resolve the identifier to a URI in Fedora
Riiif::Image.file_resolver.id_to_uri = lambda do |id|
  # Notes:
  #   In this, we should be able to resolve to simple http urls or paths on the local file system
  #     Trying something like the following resulted in an ssl error. Ex:
  #       "https://iawa.dld.lib.vt.edu/downloads/p8418n20k?file=jpg"
  #     Non-https works fine. Ex:
  #       "http://www.asobibox.com/images/Hangeul_New_Version.jpg"
  #     Local file paths work fine. Ex:
  #       "/var/local/hydra/iawa/tmp/derivatives/0z/70/8w/40/c-jpg.jpg"
  #
  logger.info "Riiif::Image.file_resolver.id_to_uri resolving id = #{id}"
  begin
    fileset_id = id.split("/").first
    logger.info "Riiif::Image.file_resolver.id_to_uri Attempting to resolve to FileSet derivative, where FileSet id = #{fileset_id}"
    path = Hyrax::DerivativePath.derivative_path_for_reference(FileSet.find(fileset_id), "jpg")
    raise "Nil derived path" if ! File.file? path
    logger.info "Riiif::Image.file_resolver.id_to_uri Path resolved to #{path}"
    path
  rescue
    logger.info "Riiif::Image.file_resolver.id_to_uri Error resolving FileSet id = #{fileset_id}. Attempting to resolve to ActiveFedora uri instead."
    ActiveFedora::Base.id_to_uri(CGI.unescape(id)).tap do |url|
      logger.info "Riiif resolved #{id} to #{url}"
    end
  end
end

# In order to return the info.json endpoint, we have to have the full height and width of
# each image. If you are using hydra-file_characterization, you have the height & width
# cached in Solr. The following block directs the info_service to return those values:
Riiif::Image.info_service = lambda do |id, file|
  # id will look like a path to a pcdm:file
  # (e.g. rv042t299%2Ffiles%2F6d71677a-4f80-42f1-ae58-ed1063fd79c7)
  # but we just want the id for the FileSet it's attached to.

  # Capture everything before the first slash
  fs_id = id.sub(/\A([^\/]*)\/.*/, '\1')
  resp = ActiveFedora::SolrService.get("id:#{fs_id}")
  doc = resp['response']['docs'].first
  raise "Unable to find solr document with id:#{fs_id}" unless doc
  { height: doc['height_is'], width: doc['width_is'] }
end

def logger
  Rails.logger
end

Riiif::Image.authorization_service = IIIFAuthorizationService
# Note that this is translated to an `expires` argument to the
# ActiveSupport::Cache::Store in use, by default the host application's
# Rails.cache. Some cache stores may not automatically purge expired content,
# such as the default FileStore.
# http://guides.rubyonrails.org/caching_with_rails.html#cache-stores
Riiif::Engine.config.cache_duration = Rails.application.secrets[:iiif][:cache_duration].to_i || 30.days
