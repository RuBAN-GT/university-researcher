class PositionPhotoSerializer < ActiveModel::Serializer
  attributes :id,
    :priority,
    :photo,
    :photo_url,
    :thumb_url,
    :position_id,
    :created_at,
    :updated_at,
    :position_id

  def photo_url
    object.photo_url
  end
  def thumb_url
    object.photo.thumb.url
  end
end
