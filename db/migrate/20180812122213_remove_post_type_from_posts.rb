class RemovePostTypeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_type, :integer
  end
end
