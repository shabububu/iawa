module Hyrax
  module Renderers
    class RightsStatementAttributeRenderer < AttributeRenderer
      private

        def attribute_value_to_html(value)
          %(<span itempop="rights_statement"><a href="/terms" target="_blank">#{value}</a></span>)
        end
    end
  end
end
