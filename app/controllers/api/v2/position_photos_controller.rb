class Api::V2::PositionPhotosController < Api::V2::ApplicationController
  include PositionPhotoControllerConcern

  def index
    super

    render :json => @position_photos,
      :meta => collection_meta(@position_photos),
      :request => request
  end

  def show
    super

    render :json => @position_photo, :request => request
  end
end
