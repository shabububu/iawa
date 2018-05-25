module Hyrax
  module Renderers
    class LicenseAttributeRenderer < AttributeRenderer

      def label
        I18n.t("simple_form.labels.defaults.license")
      end

      private

        def attribute_value_to_html(value)
          %(<span itempop="license"><a href="/terms" target="_blank">#{value}</a></span>)
        end
    end
  end
end
