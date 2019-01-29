$(document).on 'turbolinks:load', ->
  $('.ui.flash.element .close').on 'click', ->
    $(this).parent('.ui.flash.element').fadeOut 400, ->
      $(this).remove()
