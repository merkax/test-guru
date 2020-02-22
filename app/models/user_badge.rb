class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  scope :assigned_badges, -> (user, badge) { where(user: user, badge: badge) }
end
