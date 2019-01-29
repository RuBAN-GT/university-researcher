marker = ->
  $('.marker.dropdown').dropdown
    allowAdditions: true
    saveRemoteData: true
    fields:
      remoteValues: 'data'
      value: 'marker'
      name: 'marker'
    message:
      addResult: I18n.t('js.add_term')
    apiSettings:
      url: '/api/v1/genetic_markers?param_marker={query}'
      onResponse: (result) ->
        result.Response

handlers.push marker
$(document).on 'turbolinks:load', marker
