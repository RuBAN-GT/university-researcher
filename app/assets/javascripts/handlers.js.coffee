@handlers =
  register: ->
    @handler_register || []

  push: (callback) ->
    @handler_register = [] if @handler_register == undefined

    @handler_register.push callback

  run: (param = null) ->
    @register().forEach (item) ->
      item.call param
