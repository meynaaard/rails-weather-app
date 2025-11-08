class ForecastsController < ApplicationController
  def search
    query = params[:location]
    weather_data = WeatherService.get_forecast(query)

    if weather_data.nil?
      render json: { error: "Location not found" }, status: :not_found
    else
      render json: weather_data
    end

    location = Location.find_or_create_by(name: weather_data[:location][:name]) do |loc|
      loc.latitude = weather_data[:location][:latitude]
      loc.longitude = weather_data[:location][:longitude]
    end

    current = weather_data[:current]
    Forecast.create!(
      location: location,
      forecast_date: current["time"],
      weather_code: current["weather_code"],
      temperature: current["temperature_2m"],
      humidity: current["relative_humidity_2m"],
      wind_speed: current["wind_speed_10m"],
      is_day: current["is_day"]
    )
  end
end
