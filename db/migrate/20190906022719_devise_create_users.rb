class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
