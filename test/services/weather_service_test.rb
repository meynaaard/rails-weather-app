require "test_helper"

class WeatherServiceTest < ActiveSupport::TestCase
  # valid location
  test "get_forecast returns a hash for valid location: New York" do
    result = WeatherService.get_forecast("New York")
    assert result.is_a?(Hash)
    assert result[:location]
    assert result[:current] || result[:daily]
  end

  # valid location
  test "get_forecast returns a hash for valid location: Paris" do
    result = WeatherService.get_forecast("Paris")
    assert result.is_a?(Hash)
    assert result[:location]
    assert result[:current] || result[:daily]
  end

  # valid location
  test "get_forecast returns a hash for valid location: London" do
    result = WeatherService.get_forecast("London")
    assert result.is_a?(Hash)
    assert result[:location]
    assert result[:current] || result[:daily]
  end

  # empty input
  test "get_forecast handles empty input safely" do
    result = WeatherService.get_forecast("")
    assert_nil result
  end

  # gibberish input
  test "get_forecast handles gibberish input safely" do
    result = WeatherService.get_forecast("a9s8d7fh2*&^%$")
    assert_nil result
  end
end
