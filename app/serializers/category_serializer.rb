class CategorySerializer < ActiveModel::Serializer
  attributes :id,
    :original_name,
    :name,
    :full_name,
    :main_type,
    :parent_id,
    :created_at,
    :updated_at,
    :position_ids,
    :parent_id,
    :subcategory_ids
end
