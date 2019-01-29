module PrimersControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :prepare_primer, :only => %w(show edit update destroy)
  end

  def index
    @primers = Primer.filter(params.slice(
      :param_code,
      :param_direction,
      :param_sequence
    )).
    sorter(params[:param_order], params[:param_order_type]).
    paginate(:page => params[:page])
  end

  def show
  end

  def new
    @primer = Primer.new
  end

  def create
    @primer = Primer.new(primer_params)

    @primer.save
  end

  def edit
  end

  def update
    @primer.update primer_params
  end

  def destroy
    @primer.destroy
  end

  protected

    def prepare_primer
      @primer = Primer.find params[:id]
    end

    def primer_params
      params.require(:primer).permit(:code, :direction, :sequence)
    end
end
