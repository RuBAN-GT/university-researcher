class UsefulTypeSerializer < ActiveModel::Serializer
  attributes :id,
    :parent_id,
    :name,
    :created_at,
    :updated_at,
    :parent_id,
    :subtype_ids,
    :position_ids
end
