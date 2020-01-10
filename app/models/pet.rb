class Pet < ApplicationRecord
  validates :name, uniqueness: true, length: { minimum: 3 }

  has_many :photos
  has_one :profile_photo, -> { where profile_photo: true }, class_name: 'Photo'
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  has_many :likes
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'
  has_many :left_friends, ->(pet) { where(has_friended: true) }, foreign_key: :requestor_id, class_name: 'Friend'
  has_many :right_friends, ->(pet) { where(has_friended: true) }, foreign_key: :requestee_id, class_name: 'Friend'
  has_many :left_pending_friends, ->(pet) { where(has_friended: false) }, foreign_key: :requestor_id, class_name: 'Friend'
  has_many :right_pending_friends, ->(pet) { where(has_friended: false) }, foreign_key: :requestee_id, class_name: 'Friend'

  def friends
    friend_ids = left_friends.pluck(:requestee_id) + right_friends.pluck(:requestor_id)
    Pet.where(id: friend_ids)
  end

  def pending_friends
    friend_ids = left_pending_friends.pluck(:requestee_id) + right_pending_friends.pluck(:requestor_id)
    Pet.where(id: friend_ids)
  end

  def number_friends
    friends.count
  end

  def number_photos
    photos.count
  end

  def most_liked_post
    all_posts = posts.includes(:likes)

    return 'No posts' if all_posts.count.zero?

    find_most(all_posts, :likes)
  end

  def most_commented_post
    all_posts = posts.includes(:comments)

    return 'No posts' if all_posts.count.zero?

    find_most(all_posts, :comments)
  end

  # def most_popular_post
  #   return 'No posts' if posts.count.zero?

    
  # end

  def self.most_popular
    friend_count = friend_count_hash
    highest_count = friend_count.max_by { |k, v| v }[1]
    most_pop_ids = friend_count.select { |k, v| v == highest_count }.keys
    Pet.where(id: most_pop_ids)
  end

  def self.least_popular
    friend_count = friend_count_hash
    lowest_count = friend_count.min_by { |k, v| v }[1]
    least_pop_ids = friend_count.select { |k, v| v == lowest_count }.keys
    Pet.where(id: least_pop_ids)
  end

  def self.newest
    Pet.order(created_at: :desc).first
  end
  
  private

  def find_most(relation, assoc)
    assoc_count = relation.each_with_object(Hash.new(0)) { |k, h| h[k] += k.send(assoc).count }
    highest_count = assoc_count.max_by { |k, v| v }[1]
    assoc_count.select { |k, v| v == highest_count }.keys
  end

  def self.friend_count_hash
    all_friends = Friend.pluck(:requestor_id, :requestee_id).flatten
    all_friends.each_with_object(Hash.new(0)) { |f, h| h[f] += 1 }
  end

end
