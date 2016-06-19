class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :text
      t.string :title
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
