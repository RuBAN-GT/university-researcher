module CategoriesControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_category, :only => %w(show edit update destroy)
  end

  def index
    @categories = Category.filter(params.slice(
      :param_full_name,
      :param_original_name,
      :param_name,
      :param_main_type,
      :param_parent_id,
      :param_desirable_types,
      :param_expect_id
    )).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    @category.save
  end

  def edit
  end

  def update
    @category.update category_params
  end

  def destroy
    @category.destroy
  end

  protected

    def set_category
      @category = Category.find params[:id]
    end

    def category_params
      params.require(:category).permit(:name, :original_name, :parent_id, :main_type)
    end
end
