module PrimersHelper
end

class ActionView::Helpers::FormBuilder
  def select_direction(method = :direction, options = {}, html_options = {})
    options = {
      :selected => (object&.direction)
    }.merge options

    html_options = {
      :class => 'ui selection dropdownable dropdown'
    }.merge html_options

    select method, [
      [
        I18n.t('parameters.primers.direction.types.forward'),
        'forward'
      ],
      [
        I18n.t('parameters.primers.direction.types.reverse'),
        'reverse'
      ]
    ], options, html_options
  end

  def select_primers(method = :primers, options = {}, html_options = {})
    if object.new_record?
      ids = object.primers.map { |v|
        v.id
      }
    else
      ids = object.primers.ids
    end

    options = {
      :selected => ids,
      :include_blank => I18n.t('placeholders.primers.select'),
    }.merge options

    html_options = {
      :class => 'ui primers search selection dropdown',
      :multiple => true
    }.merge html_options

    collection = object.primers.collect { |v| [v.code, v.id] }
    collection = [] if collection.nil?

    select method,
      collection,
      options,
      html_options
  end
end
