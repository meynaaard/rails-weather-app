class ForecastsController < ApplicationController
  def search
    location = params[:location]
    weather_data = WeatherService.get_forecast(location)

    if weather_data.nil?
      render json: { error: "Location not found" }, status: :not_found
    else
      render json: weather_data
    end

    location = Location.find_or_create_by(name: weather_data[:location][:name]) do |loc|
      loc.latitude = weather_data[:location][:latitude]
      loc.longitude = weather_data[:location][:longitude]
    end

    daily = weather_data[:daily]
    daily["time"].each_with_index do |date, i|
      Forecast.create!(
        location: location,
        forecast_date: date,
        weather_code: daily["weather_code"][i],
        temp_min: daily["temperature_2m_min"][i],
        temp_max: daily["temperature_2m_max"][i]
      )
    end
  end
end
