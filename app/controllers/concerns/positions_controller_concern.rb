module PositionsControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_position, :only => %w(show edit update destroy)
    before_action :set_genetic_marker, :only => %w(new create show edit update destroy)
  end

  def index
    @positions = Position.filter(params.slice(
      :param_name,
      :param_original_name,
      :param_full_name,
      :param_category_id,
      :param_primer_id,
      :param_genetic_marker_id,
      :param_genetic_marker,
      :param_experiment_id,
      :param_experiment_sequence,
      :param_aligned_sequence,
      :param_useful_type_id
    )).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if position_params[:genetic_marker_attributes][:marker].blank?
      @position.genetic_marker = nil
    else
      @position.genetic_marker = GeneticMarker.find_or_initialize_by(position_params[:genetic_marker_attributes])
    end

    @position.save
  end

  def edit
  end

  def update
    @position.assign_attributes position_params

    if position_params[:genetic_marker_attributes][:marker].blank?
      @position.genetic_marker = nil
    else
      @position.genetic_marker = GeneticMarker.find_or_initialize_by(position_params[:genetic_marker_attributes])
    end

    @position.save
  end

  def destroy
    @position.destroy
  end

  protected

    def set_position
      @position = Position.find params[:id]
    end

    def set_genetic_marker
      if @position.nil? || @position.new_record? || @position.genetic_marker.nil?
        @genetic_marker = GeneticMarker.new
      else
        @genetic_marker = @position.genetic_marker
      end
    end

    def position_params
      data = params.require(:position).permit(
        :original_name,
        :name,
        :description,
        :importance,
        :restriction_map,
        :aligned_sequence,
        :useful_type_id,
        :position_photo_ids => [],
        :category_ids => [],
        :primer_ids => [],
        :genetic_marker_attributes => %w(marker),
        :experiments_attributes => [
          :genbank_id,
          :sequence,
          :id,
          :_destroy
        ]
      )

      # check arrays
      data.each do |key, item|
        if item.is_a? Array
          data[key] = item.select { |v| !v.blank? }
        end
      end

      data
    end
end
