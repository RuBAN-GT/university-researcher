class GeneticMarker < ApplicationRecord
  include Filterable

  self.per_page = 20

  # relations
  has_many :positions

  # validations
  validates :marker,
    :presence => true,
    :uniqueness => true,
    :length => { :minimum => 3, :maximum => 100 }

  # scopes
  default_scope {
    order :marker => :asc
  }
  scope :param_marker, -> (code) {
    where 'lower(marker) LIKE ?', "%#{code.mb_chars.downcase}%"
  }
end
