class PositionSerializer < ActiveModel::Serializer
  attributes :id,
    :original_name,
    :name,
    :full_name,
    :description,
    :importance,
    :restriction_map,
    :aligned_sequence,
    :created_at,
    :updated_at,
    :category_ids,
    :primer_ids,
    :experiment_ids,
    :position_photo_ids,
    :genetic_marker_id,
    :useful_type_id

  def category_ids
    object.categories.classified.map { |item| item.id }
  end
end
