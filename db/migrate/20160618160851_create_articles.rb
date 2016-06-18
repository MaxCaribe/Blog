class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :text
      t.string :title
      t.timestamps null: false
      t.string :user_login
    end
    execute 'ALTER TABLE articles
            ADD CONSTRAINT articles_to_users
            FOREIGN KEY (user_login)
            REFERENCES users (login)'
  end
end
