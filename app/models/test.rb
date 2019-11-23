class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true,
            uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, :greater_than_or_equal_to 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_categories, -> (category) {
    joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.sort_categories(category)
    sort_by_categories(category).pluck(:title)
  end
end
