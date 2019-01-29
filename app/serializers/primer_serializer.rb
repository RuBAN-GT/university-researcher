class PrimerSerializer < ActiveModel::Serializer
  attributes :id,
    :code,
    :sequence,
    :direction,
    :created_at,
    :updated_at,
    :position_ids
end
