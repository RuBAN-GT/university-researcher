module PositionsHelper
end

class ActionView::Helpers::FormBuilder
  def select_position_category(method = :category, options = {}, html_options = {})
    options = {
      :main_type => :class,
      :include_blank => I18n.t('placeholders.categories.select')
    }.merge options

    html_options = {
      :class => 'ui classified categories search selection dropdown'
    }.merge html_options

    if object.new_record?
      selected = object.categories.select { |v|
        v.main_type == options[:main_type].to_s
      }.first
    else
      selected = object.categories.where(:main_type => options[:main_type]).first
    end

    options[:selected] = selected&.id
    html_options['data-main-type'] = options[:main_type]
    html_options['data-parent-id'] = selected&.parent_id || 'null'
    html_options['name'] = "position[#{method}][]"
    html_options['id'] = "position_#{method}_#{options[:main_type]}"

    if selected.nil?
      selected = []
    else
      selected = [
        [],
        [selected.full_name, selected.id]
      ]
    end

    select method,
      selected,
      options,
      html_options
  end

  def select_useful_type(method = :useful_type, options = {}, html_options = {})
    html_options = {
      :class => 'ui search selection dropdown',
      :value => object&.useful_type&.id
    }.merge html_options

    @template.content_tag :div, :class => html_options[:class] do
      hidden_field(method, options) +
      @template.icon(:dropdown) +
      if object.useful_type.nil?
        @template.content_tag(:div, I18n.t('placeholders.positions.useful_type'), :class => 'default text')
      else
        @template.content_tag(:div, object.useful_type.name, :class => 'text')
      end +
      @template.content_tag(:div, :class => :menu) do
        options = ''

        UsefulType.all.each do |u|
          if u.subtypes.any?
            u.subtypes.each do |s|
              options += @template.content_tag :div, s.name, 'data-value' => s.id, :class => :item
            end
          elsif u.parent.nil?
            options += @template.content_tag :div, u.name, 'data-value' => u.id, :class => :item
          end
        end

        options.html_safe
      end
    end
  end
end
