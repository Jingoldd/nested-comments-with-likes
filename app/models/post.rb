class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy 
end
