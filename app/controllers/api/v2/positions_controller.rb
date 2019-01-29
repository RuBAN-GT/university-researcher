class Api::V2::PositionsController < Api::V2::ApplicationController
  include PositionsControllerConcern

  def index
    super

    render :json => @positions, :meta => collection_meta(@positions)
  end

  def show
    super

    render :json => @position, :include => %w(position_photos)
  end
end
