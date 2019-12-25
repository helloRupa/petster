class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :pet_id, null: false
      t.references :likeable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :likes, [:pet_id, :likeable_type, :likeable_id], unique: true
  end
end
