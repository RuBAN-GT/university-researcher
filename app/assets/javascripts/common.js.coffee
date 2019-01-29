handlers.push (context = null) ->
  context = 'body' if context == null

  # hand 401 errors
  $(context).find('a').bind 'ajax:error', (event, jqXHR, ajaxSettings, thrownError) ->
    if jqXHR.status == 401
      window.location.replace(this)

  # tooltip
  $(context).find('[data-tooltiped=true]').popup
    exclusive: true
    variation: 'inverted'

  # dropdown
  $(context).find('.dropdownable').dropdown()
  $(context).find('.dropdown').dropdown('refresh')

  # checkbox
  $(context).find('.ui.checkbox').checkbox()

$(document).on 'turbolinks:load', ->
  handlers.run 'body'

  # loading
  $('.loads').on 'ajax:beforeSend', ->
    loader.start()
  $('.loads').on 'ajax:complete', ->
    loader.stop()
  $('.loads').on 'ajax:error', (e, xhr, status, error) ->
    location.reload() if xhr.status == 404
