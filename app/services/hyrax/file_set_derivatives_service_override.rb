module Hyrax
  module FileSetDerivativesServiceOverride
      def create_image_derivatives(filename)
        # We're asking for layer 0, becauase otherwise pyramidal tiffs flatten all the layers together into the thumbnail
        Hydra::Derivatives::ImageDerivatives.create(filename,
                                                    outputs: [{ label: :thumbnail,
                                                                format: 'jpg',
                                                                size: '200x150>',
                                                                url: derivative_url('thumbnail'),
                                                                layer: 0 }])
        if mime_type == 'image/tiff'
            Hydra::Derivatives::ImageDerivatives.create(filename,
                                                        outputs: [{ label: :jpg,
                                                                    format: 'jpg',
                                                                    url: derivative_url('jpg'),
                                                                    layer: 0 }])
        end
      end
  end
end
