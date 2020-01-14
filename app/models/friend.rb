class Friend < ApplicationRecord
  validate :pets_are_not_friends

  belongs_to :requestor, class_name: 'Pet', primary_key: :id, foreign_key: :requestor_id
  belongs_to :requestee, class_name: 'Pet', primary_key: :id, foreign_key: :requestee_id

  def pets_are_not_friends
    if all_friend_ids.include?(requestee_id) || requestor_id == requestee_id
      errors.add(:requestor_id, 'are already friends or have requested friendship')
    end
  end

  private

  def all_friend_ids
    self.class
      .where(requestor_id: requestor_id)
      .or(self.class.where(requestee_id: requestor_id))
      .pluck(:requestee_id, :requestor_id)
      .flatten
  end
end
