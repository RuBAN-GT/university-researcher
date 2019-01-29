module PositionPhotoControllerConcern
  extend ActiveSupport::Concern

  def index
    @position_photos = PositionPhoto.paginate(:page => params[:page])
  end

  def show
    @position_photo = PositionPhoto.find params[:id]
  end
end
