# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :email,              null: false, default: ""
      t.string   :encrypted_password, null: false, default: ""
      t.datetime :remember_created_at
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.integer  :failed_attempts, default: 5, null: false
      t.datetime :locked_at
      t.string   :username

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
