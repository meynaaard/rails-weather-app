class ForecastsController < ApplicationController
  def search
    @forecast = WeatherService.get_forecast(params[:location])

    if @forecast.nil?
      flash.now[:alert] = "Location not found"
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "forecast",
            partial: "forecasts/alert",
            locals: { message: flash.now[:alert] }
          )
        end
      end
      return
    end

    location = Location.find_or_create_by(name: @forecast[:location][:name]) do |loc|
      loc.latitude = @forecast[:location][:latitude]
      loc.longitude = @forecast[:location][:longitude]
    end

    current = @forecast[:current]
    forecast = Forecast.create!(
      location: location,
      forecast_date: current["time"],
      weather_code: current["weather_code"],
      temperature: current["temperature_2m"],
      humidity: current["relative_humidity_2m"],
      wind_speed: current["wind_speed_10m"],
      is_day: current["is_day"]
    )

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "forecast",
          partial: "forecasts/current_forecast",
          locals: { forecast: @forecast }
        )
      end
    end
    return
  end
end
