class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :profile_photo
      t.string :tagline
      t.string :password_digest, null: false
      t.string :session_token

      t.timestamps
    end

    add_index :pets, :session_token, unique: true
    add_index :pets, :name
  end
end
