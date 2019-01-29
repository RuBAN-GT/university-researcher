class UsefulType < ApplicationRecord
  has_many :positions
  has_many :subtypes,
    :class_name => 'UsefulType',
    :foreign_key => 'parent_id',
    :dependent => :nullify
  belongs_to :parent, :class_name => 'UsefulType'

  default_scope {
    order :name => :asc
  }

  validates :name, :presence => true
end
