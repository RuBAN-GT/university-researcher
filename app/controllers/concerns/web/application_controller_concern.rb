module Web::ApplicationControllerConcern
  extend ActiveSupport::Concern

  included do
    layout :detect_layout

    before_action :default_meta_tags

    helper_method :parent_url
  end

  def parent_url
    url_for :action => :index, :controller => params[:controller] rescue nil
  end

  protected

    def detect_layout
      if devise_controller?
        '/web/layouts/guest'
      else
        '/web/layouts/application'
      end
    end

    def modal_render(current = nil, root = :index)
      current = params[:action] if current.nil?

      respond_to do |format|
        format.html do
          send root if respond_to? root

          render :action => root, :locals => { :modal => current }
        end
        format.js
      end
    end
end
