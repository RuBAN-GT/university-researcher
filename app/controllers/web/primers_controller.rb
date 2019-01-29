class Web::PrimersController < Web::ApplicationController
  include PrimersControllerConcern

  def show
    super

    modal_render
  end

  def new
    super

    modal_render
  end

  def create
    set_meta_tags :title => t('meta_tags.primers.create.title')

    @primer = Primer.new(primer_params)

    if @primer.save
      add_flash_message t('messages.primers.created'), :success

      redirect_to primer_path @primer
    else
      add_flash_message t('messages.primers.wrong'), :error

      index

      render :index, :locals => { :modal => :new }
    end
  end

  def edit
    super

    modal_render
  end

  def update
    set_meta_tags :title => t('meta_tags.primers.edit.title')

    if @primer.update primer_params
      add_flash_message t('messages.primers.updated'), :success

      redirect_to primer_path @primer
    else
      add_flash_message t('messages.primers.updated'), :error

      index

      render :index, :locals => { :modal => :edit }
    end
  end

  def destroy
    super

    add_flash_message t('messages.primers.destroyed'), :success

    redirect_to primers_path
  end
end
