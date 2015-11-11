class RemovePostsIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :posts_id, :integer
  end
end
