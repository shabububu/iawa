module IawaHelper

  def license_link(license)
    link_to license, hyrax.terms_path
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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
