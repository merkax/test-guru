class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
            uniqueness: { scope: :level }
  validates :level, :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_categories, -> (category) {
    joins(:category).where(categories: { title: category }) }

   scope :by_level, -> (level) { where(level: level) }
   scope :by_category, -> (category_id) { where(category_id: category_id) }

  def self.sort_categories(category)
    sort_by_categories(category).order(title: :desc).pluck(:title)
  end
end
