module IawaHelper

  def rights_statement_link(rights)
    link_to rights, hyrax.terms_path
  end

  def rights_holder_link(rights_holder)
    link_to rights_holder, "http://spec.lib.vt.edu/"
  end
end
