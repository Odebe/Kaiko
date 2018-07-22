class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title
      t.references :project, foreign_key: true
      t.integer :vol
      t.integer :num

      t.timestamps
    end
  end
end
