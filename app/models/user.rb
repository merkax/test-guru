class User < ApplicationRecord
  
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable, 
         :validatable,
         :confirmable

  scope :test_by_level, -> (level) { tests.where(level: level) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
