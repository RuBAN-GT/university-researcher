# Classification unit
class Category < ApplicationRecord
  include Filterable

  # relations
  has_and_belongs_to_many :positions, :join_table => :positions_categories
  has_many :subcategories,
    :class_name => 'Category',
    :foreign_key => 'parent_id',
    :dependent => :nullify
  belongs_to :parent, :class_name => 'Category'

  # validations
  validates :name,
    :uniqueness => {
      :scope => :original_name
    }
  validates :main_type,
    :presence => true,
    :inclusion => {
      :in => %w(class order suborder family)
    }

  validates :original_name,
    :presence => true,
    :unless => 'name.present?'
  validates :name,
    :presence => true,
    :unless => 'original_name.present?'

  validate :validate_classification

  # scopes
  default_scope {
    order :original_name => :asc, :name => :asc
  }
  scope :param_parent_id, -> (id) {
    where :parent_id => id
  }
  scope :param_full_name, -> (name) {
    where 'lower(original_name) LIKE ? OR lower(name) LIKE ?',
      "%#{name.mb_chars.downcase}%",
      "%#{name.mb_chars.downcase}%"
  }
  scope :param_original_name, -> (name) {
    where 'lower(original_name) LIKE ?', "%#{name.mb_chars.downcase}%"
  }
  scope :param_name, -> (name) {
    where 'lower(name) LIKE ?', "%#{name.mb_chars.downcase}%"
  }
  scope :param_main_type, -> (type) {
    where :main_type => type
  }
  scope :param_desirable_types, -> (main_type) {
    current = sort_rule.keys.find_index main_type.to_sym

    if current.nil? || current == 0
      types = []
    else
      types = sort_rule.keys[0, current]
    end

    where :main_type => types
  }
  scope :param_expect_id, -> (id) {
    where.not(:id => id)
  }

  # Get priorities of main_type for sorting
  # @return [Hash]
  def self.sort_rule
    {
      :class => 0,
      :order => 1,
      :suborder => 2,
      :family => 3
    }
  end

  # Get sort index for main_type
  # @return [Integer]
  def self.sort_index(type)
    self.sort_rule[type.to_sym]
  end

  # Sort collection by classification
  # @return [Collection]
  def self.classified
    collection = where nil

    collection.sort do |a, b|
      a = self.sort_rule[a.main_type.to_sym]
      b = self.sort_rule[b.main_type.to_sym]

      a <=> b
    end
  end

  # Get full name with original_name + translated name
  # @return [String]
  def full_name
    if original_name.blank? || name.blank?
      original_name || name
    else
      "#{original_name} - #{name}"
    end
  end

  # Get main type readable name
  # @return [String]
  def main_type_name
    I18n.t "parameters.categories.main_type.types.#{main_type}",  :default => main_type
  end

  protected

    def validate_classification
      if main_type.to_s == 'class'
        errors.add :parent_id, I18n.t('messages.categories.wrong_classification') unless parent.nil? || parent_id.nil?
      elsif parent_id.nil? && parent.nil?
        errors.add :parent_id, I18n.t('messages.categories.wrong_classification')
      elsif self.class.sort_index(main_type) <= self.class.sort_index(parent.main_type)
        errors.add :parent_id, I18n.t('messages.categories.wrong_classification')
      end
    end
end
