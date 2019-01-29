module GeneticMarkerControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :prepare_genetic_marker, :only => %w(show edit update destroy)
  end

  def index
    @genetic_markers = GeneticMarker.filter(params.slice(:param_marker)).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @genetic_marker = GeneticMarker.new
  end

  def create
    @genetic_marker = GeneticMarker.new(genetic_marker_params)

    @genetic_marker.save
  end

  def edit
  end

  def update
    @genetic_marker.update genetic_marker_params
  end

  def destroy
    @genetic_marker.destroy
  end

  protected

    def prepare_genetic_marker
      @genetic_marker = GeneticMarker.find params[:id]
    end

    def genetic_marker_params
      params.require(:genetic_marker).permit(:marker)
    end
end
