class MakePetNameUnique < ActiveRecord::Migration[6.0]
  def change
    remove_index :pets, :name
    add_index :pets, :name, unique: true
  end
end
