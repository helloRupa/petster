class Pet < ApplicationRecord
  has_many :photos
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  has_many :likes
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'

  def friends
    Pet.where(id: friend_ids)
  end
  
  private

  def friend_ids
    all_ids = Friend
      .where(has_friended: true)
      .where(pet_id_left: self.id)
      .or(Friend.where(pet_id_right: self.id))
      .pluck(:pet_id_right, :pet_id_left)
      .flatten
      .uniq
    all_ids.select { |id| id != self.id }
  end
end
