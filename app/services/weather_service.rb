require 'faraday'
require 'json'

class WeatherService
  BASE_URL = "https://api.open-meteo.com/v1/forecast"
  GEO_URL = "https://geocoding-api.open-meteo.com/v1/search"

  def self.get_forecast(location_name)
    location = get_coordinates(location_name)
    return nil unless location

    response = Faraday.get(BASE_URL, {
      latitude: location[:latitude],
      longitude: location[:longitude],
      current: "temperature_2m,relative_humidity_2m,is_day,weather_code,wind_speed_10m",
      daily: "weather_code,temperature_2m_max,temperature_2m_min"
    })

    data = JSON.parse(response.body)

    {
      location: location,
      current: data["current"],
      daily: data["daily"]
    }
  end

  private

  def self.get_coordinates(location_name)
    response = Faraday.get(GEO_URL, {
      name: location_name,
      count: 1,
      language: 'en',
      format: 'json'
    })

    data = JSON.parse(response.body)
    result = data["results"]&.first
    return nil unless result

    {
      name: result["name"],
      latitude: result["latitude"],
      longitude: result["longitude"]
    }
  end
end
