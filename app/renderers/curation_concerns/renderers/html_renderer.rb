module CurationConcerns
  module Renderers
    class HtmlRenderer < AttributeRenderer
      private

        def attribute_value_to_html(value)
          auto_link(ERB::Util.h(value.html_safe))
        end
    end
  end
end

