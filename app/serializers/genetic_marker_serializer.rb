class GeneticMarkerSerializer < ActiveModel::Serializer
  attributes :id,
    :marker,
    :created_at,
    :updated_at,
    :position_ids
end
