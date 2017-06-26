module SufiaHelper
  include ::BlacklightHelper
  include Sufia::BlacklightOverride
  include Sufia::SufiaHelperBehavior

  def rights_statement_link(rights)
    link_to rights, sufia.static_path('terms')
  end

  def rights_holder_link(rights_holder)
    link_to rights_holder, "http://spec.lib.vt.edu/"
  end
end
