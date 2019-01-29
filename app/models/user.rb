class User < ApplicationRecord
  include Filterable

  # Devise
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # relations
  has_and_belongs_to_many :roles, :join_table => :users_roles

  # validates
  validates :realname,
    :presence => true,
    :length => { :maximum => 60 }

  # Methods

  # Check role
  #
  # @param [String|Symbol] role
  # @return [Boolean]
  def role?(role)
    !roles.find_by_slug(role.to_s).nil?
  end
end
