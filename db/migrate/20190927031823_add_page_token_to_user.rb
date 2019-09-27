class AddPageTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :page_token, :string
  end
end
