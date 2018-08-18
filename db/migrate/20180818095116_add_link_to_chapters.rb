class AddLinkToChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :link, :string
  end
end
