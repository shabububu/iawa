module Hyrax
  module Renderers
    class RightsHolderAttributeRenderer < AttributeRenderer
      private
        def attribute_value_to_html(value)
          %(<span itemprop="rights_holder"><a href="http://spec.lib.vt.edu/">#{value}</a></span>)
        end
    end
  end
end
