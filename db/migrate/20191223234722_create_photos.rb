class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :pet_id, null: false
      t.string :photo_url, null: false

      t.timestamps
    end

    add_index :photos, :pet_id
  end
end
