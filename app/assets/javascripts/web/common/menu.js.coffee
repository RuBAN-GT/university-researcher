@menu =
  status: ->
    current = window.localStorage.getItem 'researcher.sidebar'

    if current == '1'
      true
    else
      false

  toggle: ->
    current = @status()

    if current
      $('.main.container').removeClass 'toggled'

      window.localStorage.setItem 'researcher.sidebar', '0'
    else
      $('.main.container').addClass 'toggled'

      window.localStorage.setItem 'researcher.sidebar', '1'

  setClass: ->
    $('.main.container').addClass 'toggled' if @status()

$(document).on 'turbolinks:load', ->
  menu.setClass() if $(window).width() > 767

  $('.main.menu .toggle.item').click ->
    menu.toggle()
