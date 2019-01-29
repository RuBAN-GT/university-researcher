module CategoriesHelper
end

class ActionView::Helpers::FormBuilder
  def select_main_type(method = :main_type, options = {}, html_options = {})
    options = {
      :selected => (object&.main_type)
    }.merge options

    html_options = {
      :class => 'ui main_type selection dropdown'
    }.merge html_options

    select method, [
      [
        I18n.t('parameters.categories.main_type.types.class'),
        'class'
      ],
      [
        I18n.t('parameters.categories.main_type.types.order'),
        'order'
      ],
      [
        I18n.t('parameters.categories.main_type.types.suborder'),
        'suborder'
      ],
      [
        I18n.t('parameters.categories.main_type.types.family'),
        'family'
      ],
    ], options, html_options
  end

  def select_parent_category(method = :category, options = {}, html_options = {})
    options = {
      :selected => object.parent_id,
      :include_blank => I18n.t('placeholders.categories.select')
    }.merge options

    html_options = {
      :class => 'ui parent categories search selection dropdown',
      'data-main-type' => object.main_type,
      'data-expect-id' => object.id
    }.merge html_options

    if object.parent.nil?
      collection = []
    else
      collection = [[object.parent.full_name, object.parent.id]]
    end

    select method,
      collection,
      options,
      html_options
  end
end
