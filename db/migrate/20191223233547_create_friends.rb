class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :pet_id_left, null: false
      t.integer :pet_id_right, null: false
      t.boolean :has_friended, default: false

      t.timestamps
    end

    add_index :friends, [:pet_id_left, :pet_id_right], unique: true
    add_index :friends, :pet_id_right
  end
end
