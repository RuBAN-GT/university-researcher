class Api::V2::UsefulTypesController < Api::V2::ApplicationController
  include UsefulTypesControllerConcern

  def index
    super

    render :json =>  @useful_types, :meta => collection_meta(@useful_types)
  end

  def show
    super

    render :json => @useful_type
  end
end
