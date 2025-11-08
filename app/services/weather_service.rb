require 'faraday'
require 'json'

class WeatherService
  BASE_URL = "https://api.open-meteo.com/v1/forecast"
  GEO_URL = "https://geocoding-api.open-meteo.com/v1/search"

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
