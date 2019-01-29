class Api::V2::CategoriesController < Api::V2::ApplicationController
  include CategoriesControllerConcern

  def index
    super

    render :json =>  @categories, :meta => collection_meta(@categories)
  end

  def show
    super

    render :json => @category
  end
end
