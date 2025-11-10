class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.float :latitude
      t.float :longitude
      t.string :timezone

      t.timestamps
    end
  end
end
