class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, {:id=>false} do |t|
      t.string :login         , null:false
      t.string :first_name    , null:false
      t.string :last_name     , null:false
      t.string :password_hash , null:false

      t.timestamps              null: false
    end
    execute 'ALTER TABLE users ADD PRIMARY KEY (login)'
  end
end
