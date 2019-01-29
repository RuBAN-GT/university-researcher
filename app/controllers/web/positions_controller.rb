class Web::PositionsController < Web::ApplicationController
  include PositionsControllerConcern

  def create
    super

    if @position.errors.any?
      add_flash_message I18n.t('messages.positions.wrong'), :error

      render :new
    else
      redirect_to position_path(@position), :flash => { :success => I18n.t('messages.positions.created') }
    end
  end

  def calculate
    seqs = params.require(:sequences)
    seqs = JSON.parse seqs

    @sequence = Experiment.clusted_aligned_sequence seqs

    respond_to do |format|
      format.js
    end
  end

  def update
    super

    if @position.errors.any?
      add_flash_message I18n.t('messages.positions.wrong'), :error
    else
      add_flash_message I18n.t('messages.positions.updated'), :success
    end

    render :edit
  end

  def destroy
    super

    redirect_to positions_path, :flash => {:success => I18n.t('messages.positions.destroyed')}
  end
end
