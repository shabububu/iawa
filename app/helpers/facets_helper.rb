# frozen_string_literal: true
module FacetsHelper
  include Blacklight::FacetsHelperBehavior

  ##
  # Renders the list of values 
  # removes any elements where render_facet_item returns a nil value. This enables an application
  # to filter undesireable facet items so they don't appear in the UI
  def render_facet_image_limit_list(paginator, facet_field, wrapping_element=:li)
    safe_join(paginator.items.
      map { |item| render_facet_image_item(facet_field, item) }.compact.
      map { |item| content_tag(wrapping_element,item, class: 'item-entry-li')}
    )
  end

  ##
  # Renders a single facet item
  def render_facet_image_item(facet_field, item)
    if facet_in_params?(facet_field, item.value )
      render_selected_facet_value(facet_field, item)          
    else
      render_facet_value(facet_field, item, {render_image: true})
    end
  end

  ##
  # Standard display of a facet value in a list. Used in both _facets sidebar
  # partial and catalog/facet expanded list. Will output facet value name as
  # a link to add that to your restrictions, with count in parens.
  #
  # @param [Blacklight::Solr::Response::Facets::FacetField]
  # @param [String] facet item
  # @param [Hash] options
  # @option options [Boolean] :suppress_link display the facet, but don't link to it
  # @return [String]
  def render_facet_value(facet_field, item, options ={})
    path = path_for_facet(facet_field, item)
    unless options[:render_image]
      content_tag(:span, :class => "facet-label") do
        link_to_unless(options[:suppress_link], facet_display_value(facet_field, item), path, :class=>"facet_select")
      end + render_facet_count(item.hits)
    else
      content = facet_image_content(facet_field, item)
      if !content.blank?
        content_tag(:span, :class => "item-entry") do
          link_to_unless(options[:suppress_link], content, path, :class=>"facet_select")
        end
      end
    end
  end

  def facet_image_content field, item
    facet_image = facet_display_image(field, item) 
    facet_overlay = facet_image_overlay(item)
    image_content = ""
    if !facet_image.blank? && !facet_overlay.blank?
      image_content = facet_image + facet_overlay
    end
    return image_content
  end

  def facet_display_image field, item
    if field.downcase == "creator_sim"
      imgName = item.value.split(',')[0] + '_Portrait.jpg'
      image_exists?("creator", imgName) ? image_tag(File.join('creator', imgName)) : ""
    else
      image_exists?(item.field_name, item.image_filename) ? image_tag(File.join(item.field_name, item.image_filename)) : ""
    end
  end

  def image_exists? dir, filename
    imagesPath = File.join(Rails.root.to_s, "app/assets/images")
    filePath = File.join(imagesPath, dir, filename)
    return File.file? filePath
  end

  def get_image_name item
    item.value.downcase.gsub(/[\W_]/,'') + '.jpg'
  end

  def facet_image_overlay item
    content_tag(:div, :class => "image-overlay-wrapper") do
      content_tag(:span, item.value, :class => "image-overlay")
    end
  end

end

