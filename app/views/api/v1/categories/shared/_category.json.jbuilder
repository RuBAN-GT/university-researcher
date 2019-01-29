json.id category.id
json.main_type category.main_type

json.original_name category.original_name
json.name category.name
json.full_name category.full_name

json.parent_id category.parent_id
json.subcategory_ids category.subcategory_ids
if with_definition?
  if category.subcategories.any?
    json.subcategories do
      json.array! category.subcategories, :partial => '/api/v1/categories/shared/category', :as => :category
    end
  else
    json.subcategories []
  end
end

json.position_ids category.position_ids

json.created_at category.created_at
json.updated_at category.updated_at
