class ChangePass < ActiveRecord::Migration
  def change
    rename_column :users, :password_hash, :password_digest
  end
end