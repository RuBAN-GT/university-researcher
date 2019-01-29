json.id photo.id

json.priority 0

json.url (request.protocol + request.host_with_port + photo.photo_url)
json.thumb_url (request.protocol + request.host_with_port + photo.photo.thumb.url)

json.created_at photo.created_at
json.updated_at photo.updated_at
