class Badge < ApplicationRecord
  RULES = %w[by_category first_attempt by_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image, :rule, presence: true
  validates :rule, inclusion: { in: RULES }
end
