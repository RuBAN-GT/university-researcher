class ApplicationController < ActionController::Base
  # Handle exceptions
  protect_from_forgery with: :exception

  unless Rails.env.development?
    rescue_from ActionController::RoutingError,
      ActionController::UnknownController,
      ::AbstractController::ActionNotFound,
      ActiveRecord::RecordNotFound,
      ActionController::UnknownFormat,
      ActionController::InvalidCrossOriginRequest,
      :with => :handle_error_404

    rescue_from ActionDispatch::ParamsParser::ParseError,
      ActionController::ParameterMissing,
      :with => :handle_error_400
  end

  # Handle flash messages
  def render *args
    handle_all_flash

    super
  end

  # Add message to flash array
  #
  # @param [String] message
  # @param [Symbol] type = :notice
  def add_flash_message(message, type = :notice)
    type = type.to_sym

    if flash[type].is_a? String
      flash[type] = [flash[type]]
    else
      flash[type] ||= []
    end

    flash[type] << message
  end
  helper_method :add_flash_message

  # Check user on current
  #
  # @param [User|Integer] user
  # @return [Boolean]
  def is_current?(user)
    return if current_user.nil?

    !user.nil? && current_user.id == user.id
  end
  helper_method :is_current?

  protected

    # Handle flash messages for common format
    def handle_all_flash
      tmp = {}
      flash.each { |m, s| tmp[s] = m }

      tmp.each do |m, s|
        flash[s] = [m] unless m.is_a? Array
      end
    end

    # Show 400 page
    def handle_error_400
      set_meta_tags :title => I18n.t('meta_tags.pages.error_400.title')

      namespace = params[:my_namespace].to_s || ''

      render "#{namespace}/pages/error_400", :status => 400
    end

    # Show 404 page
    def handle_error_404
      set_meta_tags :title => I18n.t('meta_tags.pages.error_404.title')

      namespace = params[:my_namespace].to_s || ''

      render "#{namespace}/pages/error_404", :status => 404
    end

    # Set default meta tags
    def default_meta_tags
      # set main site title
      set_meta_tags :site => I18n.t('meta_tags.defaults.site', :default => '')

      # set keywords
      c = I18n.t "meta_tags.#{controller_name}.#{action_name}.keywords", :default => ''
      b = I18n.t "meta_tags.#{controller_name}.defaults.keywords", :default => ''
      r = I18n.t 'meta_tags.defaults.keywords', :default => ''
      [b, c].each do |t|
        r = "#{r}, #{t}" unless t.blank?
      end
      set_meta_tags :keywords => r.split(', ')

      # set other tags
      [:title, :description].each do |tag|
        result = I18n.t "meta_tags.#{controller_name}.#{action_name}.#{tag}", :default => ''
        result = I18n.t "meta_tags.#{controller_name}.defaults.#{tag}", :default => '' if result.blank?
        result = I18n.t "meta_tags.defaults.#{tag}", :default => '' if result.blank?

        set_meta_tags tag => result unless result.blank?
      end
    end
end
