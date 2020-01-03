class Photo < ApplicationRecord
  validates_format_of :photo_url, with: URI.regexp(['http', 'https'])

  belongs_to :pet
end
