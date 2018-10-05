class RemovePreviewFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :preview, :string
  end
end
