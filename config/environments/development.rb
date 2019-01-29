Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.default_url_options = { :host => 'localhost', :port => 3000 }

  config.logger = ActiveSupport::Logger.new(nil)
  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = false
  config.assets.raise_runtime_errors = true
  config.assets.digest = true
  config.assets.quiet = true
  config.assets.compile = true

  config.file_watcher = ActiveSupport::FileUpdateChecker

  config.middleware.use I18n::JS::Middleware

  config.web_console.whitelisted_ips = '10.0.2.2'
  config.action_cable.disable_request_forgery_protection = true

  config.x.api_key = nil
end
