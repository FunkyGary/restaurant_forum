class AddAllFriendsToUsers2 < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :all_friends, :string
  end
end
