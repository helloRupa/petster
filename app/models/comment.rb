class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :post
  belongs_to :pet
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :pet 
end
