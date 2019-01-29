module GeneticMarkerHelper

end

class ActionView::Helpers::FormBuilder
  def search_genetic_marker(method = :marker, options = {}, html_options = {})
    options = {
      :placeholder => I18n.t('placeholders.positions.genetic_marker'),
      :class => :prompt,
      :value => @object.marker
    }.merge options

    html_options = {
      :class => 'ui marker search'
    }.merge html_options

    @template.content_tag :div, :class => html_options[:class] do
      @template.content_tag(:div, :class => 'ui icon input') do
        text_field(method, options) +
        @template.icon(:search)
      end +
      @template.content_tag(:div, nil, :class => :results)
    end
  end

  def select_genetic_marker(method = :marker, options = {}, html_options = {})
    options = {
      :placeholder => I18n.t('placeholders.positions.genetic_marker'),
      :include_blank => I18n.t('placeholders.positions.genetic_marker')
    }.merge options

    html_options = {
      :class => 'ui marker search selection dropdown',
      :value => object&.marker
    }.merge html_options

    @template.content_tag(:div, :class => html_options[:class]) do
      hidden_field(method, :value => html_options[:value]) +
      @template.icon(:dropdown) +
      @template.content_tag(:div, options[:placeholder], :class => 'default text')
    end
  end
end
