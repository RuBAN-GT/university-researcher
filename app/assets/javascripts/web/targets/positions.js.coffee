$('.image.link').magnificPopup
  type: 'image',
  gallery:
    enabled: true

$(document).on 'turbolinks:load', ->
  $('.ui.form').fileupload
    type: 'POST'
    dropzone: false
    url: '/position_photos'
    start: ->
      loader.start()
    stop: ->
      loader.stop()

  $('.calculate').click (event) ->
    event.preventDefault()

    seqs = []

    $('.experiment.segment textarea').each (i, item) ->
      seqs.push $(item).val()

    $.post
      url: $(this).attr('href')
      dataType: 'script'
      data: sequences: JSON.stringify(seqs)
