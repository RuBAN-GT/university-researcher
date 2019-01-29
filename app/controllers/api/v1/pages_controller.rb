class Api::V1::PagesController < Api::V1::ApplicationController
  def home
  end

  def error_400
    handle_error_400
  end
  def error_403
    handle_error_403
  end
  def error_404
    handle_error_404
  end
end
