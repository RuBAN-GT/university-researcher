class Api::V2::PrimersController < Api::V2::ApplicationController
  include PrimersControllerConcern

  def index
    super

    render :json => @primers, :meta => collection_meta(@primers)
  end

  def show
    super

    render :json => @primer
  end
end
