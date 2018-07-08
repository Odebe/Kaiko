class AddProjectToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :project, foreign_key: true
  end
end
