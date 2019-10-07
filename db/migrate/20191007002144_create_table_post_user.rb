class CreateTablePostUser < ActiveRecord::Migration[5.2]
  def change
    create_table :post_users do |t|
      t.references :post, index: true
      t.references :user, index: true
    end
  end
end
