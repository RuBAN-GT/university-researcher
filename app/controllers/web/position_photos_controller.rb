class Web::PositionPhotosController < Web::ApplicationController
  def create
    data = photo_params

    @position_photo = PositionPhoto.new(
      :position_id => data[:id],
      :photo => data[:add_photo]
    )

    @position_photo.save

    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @position_photo = PositionPhoto.find(params[:id])

    @position_photo.destroy

    respond_to do |format|
      format.js {}
    end
  end

  protected

    def photo_params
      params.require(:position).permit(:id, :add_photo)
    end
end
