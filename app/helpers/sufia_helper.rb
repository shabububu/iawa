module SufiaHelper
  include ::BlacklightHelper
  include Sufia::BlacklightOverride
  include Sufia::SufiaHelperBehavior

  def rights_statement_link(rights)
    link_to rights, "https://digitalsc.lib.vt.edu/files/thumbnails/spec_forms/PubPermission.doc"
  end

  def rights_holder_link(rights_holder)
    link_to rights_holder, "http://spec.lib.vt.edu/"
  end
end
