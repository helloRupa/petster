class Friend < ApplicationRecord
  belongs_to :pet_left, class_name: 'Pet', primary_key: :id, foreign_key: :pet_id_left
  belongs_to :pet_right, class_name: 'Pet', primary_key: :id, foreign_key: :pet_id_right
end
