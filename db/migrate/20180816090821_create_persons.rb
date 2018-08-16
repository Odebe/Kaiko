class CreatePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :situations

      t.timestamps
    end
  end
end
