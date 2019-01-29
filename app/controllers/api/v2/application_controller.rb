class Api::V2::ApplicationController < ApplicationController
  include Api::ApplicationControllerConcern

  def handle_error_400
    api_response.error_code = 400

    render "api/v2/pages/error_400", :status => 400
  end
  def handle_error_403
    api_response.error_code = 403

    render "api/v2/pages/error_403", :status => 403
  end
  def handle_error_404
    render "api/v2/pages/error_404", :status => 404
  end
end
