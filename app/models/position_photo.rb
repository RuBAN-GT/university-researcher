class PositionPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # relations
  belongs_to :position

  # validations
  validates :photo,
    :presence => true,
    :file_size => { :less_than => 20.megabytes }


  # scopes
  default_scope {
    order :priority => :asc
  }
end
