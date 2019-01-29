$(document).on 'turbolinks:load', ->
  return if typeof(CKEDITOR) == 'undefined'

  $('.js-ckeditor').each ->
    CKEDITOR.replace $(this).attr('id'), { toolbar: 'simple' }

$(document).on 'turbolinks:before-cache', ->
  return if typeof(CKEDITOR) == 'undefined'

  for name of CKEDITOR.instances
    CKEDITOR.instances[name].destroy() if name?
