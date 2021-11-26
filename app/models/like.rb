class Like < ApplicationRecord
  # Validation to reinforce uniqueness, avoids a user liking multiple times the same object, at model level
  # When making likes polymorphic, post_id becomes likeable_id and likeable_type needs to be added to the scope
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] } 

  belongs_to :user
  belongs_to :likeable, polymorphic: true 
end
