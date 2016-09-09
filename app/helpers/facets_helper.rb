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
      content_tag(:span, :class => "item-entry") do
        link_to_unless(options[:suppress_link], facet_image_content(facet_field, item), path, :class=>"facet_select")
      end
    end
  end

  def facet_image_content field, item
    facet_display_image(field, item) + facet_image_overlay(item)
  end

  def facet_display_image field, item
    case field.downcase
    when "medium_sim"
      imgName = item.value.downcase.gsub(/[\s\-]/,'') + '.jpg'
      image_tag File.join('mediums', imgName)
    when "creator_sim"
      imgName = item.value.split(',')[0] + '_Portrait.jpg'
      image_tag File.join('creators', imgName)
    else
      image_tag File.join("/downloads","#{item.thumbnail_id}?file=thumbnail")
    end
  end

  def facet_image_overlay item
    content_tag(:div, :class => "image-overlay-wrapper") do
      content_tag(:span, item.value, :class => "image-overlay")
    end
  end

end

