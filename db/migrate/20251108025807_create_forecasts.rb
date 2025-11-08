class CreateForecasts < ActiveRecord::Migration[8.1]
  def change
    create_table :forecasts do |t|
      t.references :location, null: false, foreign_key: true
      t.datetime :forecast_date
      t.integer :weather_code
      t.float :temp_min
      t.float :temp_max
      t.float :humidity
      t.float :wind_speed

      t.timestamps
    end
  end
end
