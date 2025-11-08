class CreateForecasts < ActiveRecord::Migration[8.1]
  def change
    create_table :forecasts do |t|
      t.references :location, null: false, foreign_key: true
      t.datetime :forecast_date
      t.integer :weather_code
      t.float :temperature
      t.float :humidity
      t.float :wind_speed
      t.integer :is_day

      t.timestamps
    end
  end
end
