class RestoreDbAuth < ActiveRecord::Migration
  def change
    remove_index :users, :provider
    remove_index :users, :uid

    remove_column :users, :provider, :string, null: false
    remove_column :users, :uid, :string, null: false

    add_column :users, :remember_created_at, :datetime
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :reset_password_token, :string
    add_column :users, :encrypted_password, :string, null: false, default: ''
    add_column :users, :guest, :boolean, default: false

    add_index :users, :reset_password_token
    add_index :users, :email
  end
end
