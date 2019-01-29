primers = ->
  $('.primers.dropdown').dropdown
    hideAdditions: true
    saveRemoteData: false
    fields:
      remoteValues: 'data'
      value: 'id'
      name: 'code'
    message:
      addResult: I18n.t('js.add_term')
      noResults: I18n.t('js.no_results')
    apiSettings:
      url: '/api/v1/primers?param_code={query}'
      onResponse: (result) ->
        result.Response
  $('.primers.dropdown').each ->
    menu = $(this)

    menu.dropdown 'clear'
    menu.find('option[selected]').each ->
      unless $(this).val() == undefined
        menu.dropdown 'set selected', $(this).val()

handlers.push primers
$(document).on 'turbolinks:load', primers
