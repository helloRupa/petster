class AddProfilePhotoToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :profile_photo, :boolean, default: false
  end
end
