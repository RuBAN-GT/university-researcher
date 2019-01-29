class Role < ApplicationRecord
  # relations
  has_and_belongs_to_many :users, :join_table => :users_roles

  # validations
  validates :slug, :presence => true, :uniqueness => true, :format => { :with => /\A[a-zA-Z0-9_-]+\z/ }
end
