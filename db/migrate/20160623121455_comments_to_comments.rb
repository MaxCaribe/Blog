class CommentsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :to_comment, :integer, :limit => 11
  end
end
