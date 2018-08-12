class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.boolean :published, default: false, null: false
      t.references :project, foreign_key: true
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
