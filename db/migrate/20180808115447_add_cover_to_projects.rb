class AddCoverToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :cover, :string
  end
end
