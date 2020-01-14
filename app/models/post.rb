class Post < ApplicationRecord
  validates :content, length: { minimum: 3 }

  belongs_to :pet
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :pet
  has_many :comments
  has_many :commenters, through: :comments, source: :pet

  def number_likes
    likes.size
  end

  def number_comments
    comments.size
  end

  def score
    number_likes + number_comments
  end

  def self.most_popular
    high_score_post = nil
    high_score = 0

    Post.includes(:likes, :comments).each do |p|
      score = p.score

      if score > high_score
        high_score_post = p
        high_score = score
      end
    end

    high_score_post
  end
end
