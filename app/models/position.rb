class Position < ApplicationRecord
  include Filterable

  self.per_page = 20

  alias_attribute :photos, :position_photos

  # relations
  has_and_belongs_to_many :categories, :join_table => :positions_categories
  has_and_belongs_to_many :primers, :join_table => :positions_primers
  has_many :experiments, :dependent => :destroy
  has_many :position_photos, :dependent => :destroy
  belongs_to :genetic_marker
  belongs_to :useful_type

  accepts_nested_attributes_for :genetic_marker
  accepts_nested_attributes_for :experiments,
    :allow_destroy => true
  accepts_nested_attributes_for :position_photos

  # validations
  validates :name, :uniqueness => { :scope => :original_name }
  validates_associated :genetic_marker

  validates :category_ids, :presence => {
    :message => I18n.t('messages.positions.empty_categories')
  }, :if => 'categories.nil? || categories.empty?'
  validates :categories, :presence => {
    :message => I18n.t('messages.positions.empty_categories')
  }, :if => 'category_ids.nil? || category_ids.empty?'

  validate :validate_categories_classification

  validates :original_name,
    :presence => true,
    :unless => 'name.present?'
  validates :name,
    :presence => true,
    :unless => 'original_name.present?'

  # callbacks
  before_save :handle_restriction_map

  # scopes
  default_scope {
    order :original_name => :asc, :name => :asc
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
  scope :param_category_id, -> (id) {
    joins(:categories).where :categories => { :id => id }
  }
  scope :param_primer_id, -> (id) {
    joins(:primers).where :primers => { :id => id }
  }
  scope :param_experiment_id, -> (id) {
    joins(:experiments).where :experiments => { :id => id }
  }
  scope :param_genetic_marker_id, -> (id) {
    where :genetic_marker_id => id
  }
  scope :param_genetic_marker, -> (marker) {
    joins(:genetic_markers).where 'lower(genetic_markers.marker) LIKE ?', "%#{marker.mb_chars.downcase}%"
  }
  scope :param_experiment_sequence, -> (sequence) {
    joins(:experiments).where 'lower(experiments.sequence) LIKE ?', "%#{sequence.mb_chars.downcase}%"
  }
  scope :param_aligned_sequence, -> (sequence) {
    where 'lower(aligned_sequence) LIKE ?', "%#{sequence.mb_chars.downcase}%"
  }
  scope :param_useful_type_id, -> (id) {
    where :useful_type_id => id
  }

  # methods

  # Get full name with original_name + translated name
  # @return [String]
  def full_name
    if original_name.blank? || name.blank?
      original_name || name
    else
      "#{original_name} - #{name}"
    end
  end

  # Check existing of category by type for position
  # @return [Boolean]
  def has_category_by_type?(type)
    categories.where(:main_type => type).any?
  end

  # Format restriction map for semantic style
  def handle_restriction_map
    return unless self.restriction_map.present?

    rmap = Nokogiri::HTML.fragment self.restriction_map
    rmap.search('table').attr(
      :style => 'width:100%',
      :class => 'ui celled selectable small striped table'
    )
    rmap.search('table thead td').each do |td|
      td.name = 'th'
    end

    self.restriction_map = rmap.to_html
  end

  protected

    def validate_categories_classification
      if categories.any?
        collection = Category.where :id => categories.map(&:id)

        # Check count
        collection.each do |c|
          if collection.where(:main_type => c.main_type).length > 1
            errors.add :category_ids, I18n.t('messages.positions.wrong_classify')

            return
          end
        end

        # Check existing
        if collection.where(:main_type => :class).empty?
          errors.add :category_ids, I18n.t('messages.positions.wrong_classify')
        elsif collection.where(:main_type => :order).empty?
          errors.add :category_ids, I18n.t('messages.positions.wrong_classify')
        elsif collection.where(:main_type => [:suborder, :family]).empty?
          errors.add :category_ids, I18n.t('messages.positions.wrong_classify')
        end

        # Check structure
        collection.classified.each_cons(2) do |i, j|
          errors.add :category_ids, I18n.t('messages.positions.wrong_classify') unless j.parent == i
        end
      end
    end
end
