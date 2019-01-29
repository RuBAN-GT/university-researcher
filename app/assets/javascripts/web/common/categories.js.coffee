cat = ->
  $('.parent.categories.dropdown').dropdown
    hideAdditions: true
    saveRemoteData: false
    fields:
      remoteValues: 'data'
      value: 'id'
      name: 'full_name'
    message:
      noResults: I18n.t('js.no_results')
    apiSettings:
      url: '/api/v1/categories?param_full_name={query}'
      beforeSend: (setting) ->
        type = $(this).find('select').attr('data-main-type') || null
        expect = $(this).find('select').attr('data-expect-id') || 0

        setting.url = "#{setting.url}&param_desirable_types=#{type}"
        setting.url = "#{setting.url}&param_expect_id=#{expect}"

        setting
      onResponse: (result) ->
        result.Response
  $('.parent.categories.dropdown').each ->
    $(this).dropdown 'clear'

    value = $(this).find('option[selected]').val()
    unless value == undefined
      $(this).dropdown 'set selected', value

  $('.main_type.dropdown').dropdown
    onChange: (value, text) ->
      selectors = $(this).parents('form').find('[data-main-type]')

      selectors.attr('data-main-type', value)

      selectors.dropdown('refresh')
        .dropdown('clear')
        .dropdown(
          'set text',
          selectors
            .find('option[value=""]:first-of-type')
            .text()
        )

  $('.classified.categories.dropdown').dropdown
    hideAdditions: true
    saveRemoteData: false
    fields:
      remoteValues: 'data'
      value: 'id'
      name: 'full_name'
    message:
      noResults: I18n.t('js.no_results')
    onChange: (value) ->
      $(this).parents('.field').nextAll('.field.category')
        .find('.dropdown')
        .dropdown('clear')
        .dropdown(
          'set text',
          $(this).find('option[value=""]:first-of-type').text()
        )

      if $(this).find('select').attr('data-main-type') == 'order'
        next = $(this).parents('.field').nextAll('.field.category')
      else
        next = $(this).parents('.field').next('.field.category')

      next.find('.disabled').removeClass 'disabled'
      next.find('select')
        .attr('data-parent-id', value)
        .attr('disabled', false)
    apiSettings:
      url: '/api/v1/categories?param_full_name={query}'
      beforeSend: (setting) ->
        type = $(this).find('select').attr('data-main-type') || null
        parent = $(this).find('select').attr('data-parent-id') || 0

        setting.url = "#{setting.url}&param_main_type=#{type}"
        setting.url = "#{setting.url}&param_parent_id=#{parent}"

        setting
      onResponse: (result) ->
        result.Response
  $('.classified.categories.dropdown').each ->
    $(this).dropdown 'clear'

    value = $(this).find('option[selected]').val()
    unless value == undefined
      $(this).dropdown 'set selected', value

handlers.push cat
$(document).on 'turbolinks:load', cat
