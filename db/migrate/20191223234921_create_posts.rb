class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :pet_id, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_index :posts, :pet_id
  end

end
