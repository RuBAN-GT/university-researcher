@modal =
  init: (object) ->
    return if $(object).length == 0

    # hide other modals
    name = '.' + $(object).attr('class').split(' ').join '.'
    $('.ui.modal').not(name).modal('hide')

    # init modal window
    $(object).modal(
      autofocus: false
      observeChanges: true
      onShow: ->
        window.history.replaceState(
          {},
          document.title,
          $(this).data('url')
        )

        # run call handlers for modal window
        handlers.run name

      onHide: ->
        unless modal.parent_url() == undefined
          window.history.replaceState(
            {},
            document.title,
            modal.parent_url()
          )

      onApprove: ->
        if $(this).find('form').length
          $(this).find('form').submit()

          return false
    ).modal('show')

    # handle form
    $(object).on 'click', '.send', ->
      if $(object).find('form').length
        $(object).find('form').submit()

    # clear old data
    $(document).on 'turbolinks:before-visit', ->
      # remove old dom with chat
      $(object).modal 'hide'

      # clear cache
      Turbolinks.clearCache()

    return true

  start: (selector) ->
    @init selector

  render: (html) ->
    @init html

  hide: (selector = null) ->
    selector = '.ui.modal' if selector == null

    $(selector).modal 'hide'

  parent_url: ->
    url = $(document).find('[data-parent-url]:last-of-type').data('parent-url')

    if url == undefined
      $(document).find('meta[name="parent-url"]').attr('content')
    else
      url
