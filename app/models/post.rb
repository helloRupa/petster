class Post < ApplicationRecord
  validates :content, length: { minimum: 3 }

  belongs_to :pet
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :pet
  has_many :comments

  def like_count
    likes.count
  end
end
