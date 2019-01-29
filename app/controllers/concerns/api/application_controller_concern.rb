module Api::ApplicationControllerConcern
  extend ActiveSupport::Concern

  included do
    protect_from_forgery with: :null_session

    respond_to :json

    before_action :check_api_key
    before_action :api_response

    helper_method :api_response
    helper_method :with_definition?
  end

  # Get api response handler
  def api_response
    return @api_response unless @api_response.nil?

    @api_response = ApiResponse.new
  end

  # Get user api key
  def api_key
    request.headers['X-API-Key']
  end

  # Check request on definition status
  def with_definition?
    !params[:definition].nil?
  end

  protected

    # API-Key verification
    def check_api_key
      key = Rails.configuration.x.api_key

      handle_error_403 unless key.nil? && api_key == key
    end

    # Push flash to ApiResponse handler
    def handle_all_flash
      super

      flash.each do |status, messages|
        api_response.message status, messages
      end
    end

    def handle_error_400
      api_response.error_code = 400

      render "api/v1/pages/error_400", :status => 400
    end
    def handle_error_403
      api_response.error_code = 403

      render "api/v1/pages/error_403", :status => 403
    end
    def handle_error_404
      api_response.error_code = 404

      render "api/v1/pages/error_404", :status => 404
    end

    def collection_meta(collection)
      {
        :total_pages =>  collection.total_pages,
        :total_entries =>  collection.total_entries,
        :prev_page => collection.previous_page,
        :current_page =>  collection.current_page,
        :next_page => collection.next_page,
      }
    end
end
