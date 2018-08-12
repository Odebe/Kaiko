class RemoveProjectFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :project, foreign_key: true
  end
end
