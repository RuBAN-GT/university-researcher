class Api::V2::GeneticMarkersController < Api::V2::ApplicationController
  include GeneticMarkerControllerConcern

  def index
    super

    render :json => @genetic_markers, :meta => collection_meta(@genetic_markers)
  end

  def show
    super

    render :json => @genetic_marker
  end
end
