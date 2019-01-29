module UsefulTypesControllerConcern
  extend ActiveSupport::Concern

  def index
    @useful_types = UsefulType.paginate(:page => params[:page])
  end

  def show
    @useful_type = UsefulType.find params[:id]
  end
end
