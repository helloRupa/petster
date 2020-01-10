class DeleteProfilePhotoFromPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :profile_photo, :string
  end
end
