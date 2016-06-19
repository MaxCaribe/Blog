class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user_login
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
