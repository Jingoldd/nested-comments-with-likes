class Comment < ApplicationRecord
  validates :content, presence: true 

  belongs_to :post
  belongs_to :user

  # Nested comments associations setup
  belongs_to :parent, class_name: 'Comment', optional: true #'Parent' class don't exist, we have to specify the class name. Optional true for 'parent' comments
  has_many :comments, foreign_key: :parent_id # We have to specify the column of the table to find the 'child' comments
end
