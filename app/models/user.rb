require 'digest/sha1'

class User < ApplicationRecord
  
  VALID_EMAIL_REGEX = /.+@.+\..+/i

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: :true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  
  scope :test_by_level, -> (level) { tests.where(level: level) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
