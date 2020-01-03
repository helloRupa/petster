class Like < ApplicationRecord
  validates :pet_id, uniqueness: { scope: [:likeable_type, :likeable_id] , message: 'has already liked this item'}

  belongs_to :likeable, polymorphic: true
  belongs_to :pet

end
