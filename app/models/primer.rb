class Primer < ApplicationRecord
  include Filterable

  self.per_page = 20

  # relations
  has_and_belongs_to_many :positions, :join_table => :positions_primers

  # validations
  validates :code,
    :presence => { :message => I18n.t('messages.primers.empty_code') },
    :uniqueness => true,
    :length => { :maximum => 100 }
  validates :sequence,
    :presence => { :message => I18n.t('messages.primers.empty_sequence') },
    :length => { :maximum => 500 }
  validates :direction,
    :presence => true,
    :inclusion => {
      :in => %w(forward reverse),
      :message => I18n.t('messages.primers.wrong_direction')
    }

  # scopes
  default_scope {
    order :code => :asc
  }
  scope :param_code, -> (code) {
    where 'code LIKE ?', "%#{code}%"
  }
  scope :param_sequence, -> (seq) {
    where 'sequence LIKE ?', "%#{seq}%"
  }
  scope :param_direction, -> (d) {
    where :direction => d
  }
  scope :param_order, -> (field) {
    reorder(field => :asc) if %w(code direction sequence).include? field
  }
  scope :sorter, -> (field, type) {
    type  = :asc  unless %w(asc desc).include? type
    field = :code unless %w(code direction sequence).include? field

    reorder field => type
  }

  # methods
  def direction_name
    I18n.t "parameters.primers.direction.types.#{direction}"
  end
end
