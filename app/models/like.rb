class Like < ApplicationRecord
  # Validation to reinforce uniqueness, avoids a user liking multiple times the same post, at model level
  validates :user_id, uniqueness: { scope: :post_id }

  belongs_to :user
  belongs_to :post
end
