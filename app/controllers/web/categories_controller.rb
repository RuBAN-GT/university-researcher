class Web::CategoriesController < Web::ApplicationController
  include CategoriesControllerConcern

  def index
    @categories = Category.
      where(:parent_id => nil).
        filter(params.slice(
          :param_original_name,
          :param_name,
          :param_main_type
        )).paginate(:page => params[:page])
  end

  def new
    super

    modal_render
  end

  def create
    set_meta_tags :title => t('meta_tags.categories.create.title')

    @category = Category.new(category_params)

    if @category.save
      add_flash_message t('messages.categories.created'), :success

      redirect_to category_path @category
    else
      add_flash_message t('messages.categories.wrong'), :error

      index

      render :index, :locals => { :modal => :new }
    end
  end

  def edit
    super

    modal_render
  end

  def update
    set_meta_tags :title => t('meta_tags.categories.edit.title')

    if @category.update category_params
      add_flash_message t('messages.categories.updated'), :success

      redirect_to category_path @category
    else
      add_flash_message t('messages.categories.wrong'), :error

      index

      render :index, :locals => { :modal => :edit }
    end
  end

  def destroy
    super

    add_flash_message t('messages.categories.destroyed'), :success

    redirect_to categories_path
  end
end
