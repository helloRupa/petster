class Friend < ApplicationRecord
  validate :pets_are_not_friends

  belongs_to :pet_left, class_name: 'Pet', primary_key: :id, foreign_key: :pet_id_left
  belongs_to :pet_right, class_name: 'Pet', primary_key: :id, foreign_key: :pet_id_right

  def pets_are_not_friends
    if all_friend_ids.include?(pet_id_right) || pet_id_left == pet_id_right
      errors.add(:pet_id_left, 'are already friends or have requested friendship')
    end
  end

  private

  def all_friend_ids
    Friend
      .where(pet_id_left: pet_id_left)
      .or(Friend.where(pet_id_right: pet_id_left))
      .pluck(:pet_id_right, :pet_id_left)
      .flatten
  end
end
