class CommentChange < ActiveRecord::Migration
  def change
    remove_column :comments, :user_login
  end
end
