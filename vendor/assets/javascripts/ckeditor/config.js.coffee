unless CKEDITOR == undefined

  CKEDITOR.editorConfig = (config) ->
    config.skin = 'bootstrapck'
    config.toolbar_simple = [
      {name: 'document', items: ['Source']},
      {name: 'basicstyles', items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']},
      {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
      {name: 'paragraph', items: ['NumberedList', 'BulletedList']},
      {name: 'insert', items: ['Table', 'HorizontalRule']},
      {name: 'styles', items: ['Format']},
      {name: 'tools', items: ['Maximize']}
    ]
