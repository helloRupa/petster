class ChangeColumnNamesInFriends < ActiveRecord::Migration[6.0]
  def change
    rename_column :friends, :pet_id_left, :requestor_id
    rename_column :friends, :pet_id_right, :requestee_id
  end
end
