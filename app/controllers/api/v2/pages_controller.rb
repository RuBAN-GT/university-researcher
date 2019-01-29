class Api::V2::PagesController < Api::V2::ApplicationController
  def error_400
    render :nothing => true, :status => 400
  end
  def error_403
    render :nothing => true, :status => 403
  end
  def error_404
    render :nothing => true, :status => 404
  end
end
