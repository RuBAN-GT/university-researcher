Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(web.js web.css web/guest */targets/*)
Rails.application.config.assets.precompile += %w(ckeditor/*)
Rails.application.config.assets.precompile += %w(rails_admin/rails_admin.css rails_admin/rails_admin.js)
