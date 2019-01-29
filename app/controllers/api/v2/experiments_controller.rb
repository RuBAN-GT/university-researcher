class Api::V2::ExperimentsController < Api::V2::ApplicationController
  include ExperimentsControllerConcern

  def index
    super

    render :json => @experiments, :meta => collection_meta(@experiments)
  end

  def show
    super

    render :json => @experiment
  end
end
