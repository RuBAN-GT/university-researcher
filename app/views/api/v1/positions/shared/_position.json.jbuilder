json.id position.id

json.original_name position.original_name
json.name position.name
json.full_name position.full_name

json.description position.description
json.importance position.importance
json.aligned_sequence position.aligned_sequence
json.restriction_map position.restriction_map

json.genetic_marker_id position.genetic_marker_id
if with_definition?
  if position.genetic_marker.nil?
    json.genetic_marker = nil
  else
    json.genetic_marker do
      json.partial! '/api/v1/genetic_markers/shared/genetic_marker', :genetic_marker => position.genetic_marker
    end
  end
end

json.useful_type_id position.useful_type_id
if with_definition?
  if position.useful_type.nil?
    json.useful_type nil
  else
    json.useful_type do
      json.partial! '/api/v1/useful_types/shared/useful_type', :useful_type => position.useful_type
    end
  end
end

json.experiment_ids do
  json.array! position.experiment_ids
end
if with_definition?
  if position.experiments.any?
    json.experiments do
      json.array! position.experiments, :partial => '/api/v1/experiments/shared/experiment', :as => :experiment
    end
  else
    json.experiments []
  end
end

json.category_ids do
  json.array! position.categories.classified.map { |i| i.id }
end
if with_definition?
  if position.categories.any?
    json.categories do
      json.array! position.categories.classified, :partial => '/api/v1/categories/shared/category_nested', :as => :category
    end
  else
    json.categories []
  end
end

json.primer_ids do
  json.array! position.primer_ids
end
if with_definition?
  if position.primers.any?
    json.primers do
      json.array! position.primers, :partial => '/api/v1/primers/shared/primer', :as => :primer
    end
  else
    json.primers []
  end
end

json.photo_urls do
  json.array! position.photos do |photo|
    json.url (request.protocol + request.host_with_port + photo.photo_url)
    json.thumb_url (request.protocol + request.host_with_port + photo.photo.thumb.url)
  end
end
if with_definition?
  if position.photos.any?
    json.photos do
      json.array! position.photos, :partial =>  '/api/v1/positions/shared/photo', :as => :photo
    end
  else
    json.photos []
  end
end

json.created_at position.created_at
json.updated_at position.updated_at
