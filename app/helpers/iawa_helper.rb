module IawaHelper

  def rights_statement_link(rights)
    link_to rights, hyrax.terms_path
  end

  def rights_holder_link(rights_holder)
    link_to rights_holder, "http://spec.lib.vt.edu/"
  end

  def link_to_html(field, show_link = true)
    if field.is_a? Hash
        options = field[:config].separator_options || {}
        text = field[:value].to_sentence(options)
      else
        text = field
      end
      # this block is only executed when a link is inserted;
      # if we pass text containing no links, it just returns text.
      auto_link(text.html_safe) do |value|
        "<span class='glyphicon glyphicon-new-window'></span>#{('&nbsp;' + value) if show_link}"
      end
  end
end
