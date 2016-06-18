class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user_login
      t.references :article, index: true, foreign_key: true
      t.timestamps null: false
    end
    execute 'ALTER TABLE comments
            ADD CONSTRAINT comments_to_users
            FOREIGN KEY (user_login)
            REFERENCES users (login)'
  end
end
