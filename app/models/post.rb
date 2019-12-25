class Post < ApplicationRecord
  belongs_to :pet
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :pet 
end
