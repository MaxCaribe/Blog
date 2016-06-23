class TextResize < ActiveRecord::Migration
  def change
    change_column :articles, :text, :string, limit: 10000
    change_column :comments, :text, :string, limit: 10000
  end
end
