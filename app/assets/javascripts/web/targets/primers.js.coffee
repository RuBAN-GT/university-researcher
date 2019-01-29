$('#param_order').dropdown
  onChange: ->
    $(this).parents('form').submit()

modal.start '.ui.modal.primer'
