$(document).on 'turbolinks:load', ->
  $('.clear.link').on 'click', ->
    $(this).parents('.field').find('.dropdown')
      .dropdown 'clear'
