class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def test_by_level(level)
    tests.where(level: level)
  end
end
