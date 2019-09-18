class AddUsersToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :references, :users
  end
end
