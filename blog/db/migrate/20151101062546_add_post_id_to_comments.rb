class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :postid, :integer
  end
end
