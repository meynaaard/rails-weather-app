class ForecastsController < ApplicationController
  def search
    location = params[:location]
    if location.blank?
      render json: { error: "Missing location parameter" }, status: :bad_request
      return
    end

    data = WeatherService.get_forecast(location)
    if data.nil?
      render json: { error: "Location not found" }, status: :not_found
    else
      render json: data
    end
  end
end
