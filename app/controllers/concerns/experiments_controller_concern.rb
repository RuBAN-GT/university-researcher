module ExperimentsControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_position, :only => %w(index show)
    before_action :set_experiment, :only => %w(show)
  end

  def index
    @experiments = @position.experiments.paginate(:page => params[:page])
  end

  def show
  end

  protected

    def set_position
      @position = Position.find params[:position_id]
    end
    def set_experiment
      @experiment = Experiment.find params[:id]
    end
end
