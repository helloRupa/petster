class Photo < ApplicationRecord
  validates_format_of :photo_url, with: URI.regexp(['http', 'https'])
  validate :one_profile_photo

  belongs_to :pet

  def one_profile_photo
    return if profile_photo == false || 
      self.class.where(pet_id: self.pet_id).where(profile_photo: true).size == 0
    errors.add(:pet_id, 'already has a profile photo')
  end
end
