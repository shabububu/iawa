module IIIFManifest
  class ManifestBuilder
    module CanvasBuilderOverride

      private
        def apply_record_properties
          canvas['@id'] = path
          # In some cases, we are using derivatives rather than the original 
          # files, so we're removing the extension from the default canvas 
          # label to avoid any confusion. 
          canvas.label = Pathname(record.to_s).sub_ext ''
        end
    end
  end
end
