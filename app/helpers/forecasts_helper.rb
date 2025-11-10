module ForecastsHelper
  WEATHER_CODES = {
    0 => { name: "Clear Sky", icons: { day: "clear.svg", night: "clear-night.svg" } },
    1 => { name: "Mainly Clear", icons: { day: "clear.svg", night: "clear-night.svg" } },
    2 => { name: "Partly Cloudy", icons: { day: "partly-cloudy.svg", night: "partly-cloudy-night.svg" } },
    3 => { name: "Overcast", icons: { day: "overcast.svg", night: "overcast.svg" } },
    45 => { name: "Fog", icons: { day: "fog.svg", night: "fog-night.svg" } },
    48 => { name: "Rime Fog", icons: { day: "rime-fog.svg", night: "rime-fog.svg" } },
    51 => { name: "Light Drizzle", icons: { day: "light-drizzle.svg", night: "light-drizzle.svg" } },
    53 => { name: "Moderate Drizzle", icons: { day: "drizzle.svg", night: "drizzle.svg" } },
    55 => { name: "Heavy Drizzle", icons: { day: "heavy-drizzle.svg", night: "heavy-drizzle.svg" } },
    56 => { name: "Light Freezing Drizzle", icons: { day: "drizzle.svg", night: "drizzle.svg" } },
    57 => { name: "Dense Freezing Drizzle", icons: { day: "heavy-drizzle.svg", night: "heavy-drizzle.svg" } },
    61 => { name: "Slight Rain", icons: { day: "slight-rain.svg", night: "slight-rain-night.svg" } },
    63 => { name: "Moderate Rain", icons: { day: "rain.svg", night: "rain.svg" } },
    65 => { name: "Heavy Rain", icons: { day: "heavy-rain.svg", night: "heavy-rain.svg" } },
    66 => { name: "Light Freezing Rain", icons: { day: "rain.svg", night: "rain.svg" } },
    67 => { name: "Heavy Freezing Rain", icons: { day: "heavy-rain.svg", night: "heavy-rain.svg" } },
    71 => { name: "Slight Snowfall", icons: { day: "light-snow.svg", night: "light-snow-night.svg" } },
    73 => { name: "Moderate Snowfall", icons: { day: "snow.svg", night: "snow.svg" } },
    75 => { name: "Heavy Snowfall", icons: { day: "heavy-snow.svg", night: "heavy-snow.svg" } },
    77 => { name: "Snow Grains", icons: { day: "snow-grains.svg", night: "snow-grains.svg" } },
    80 => { name: "Slight Rain Showers", icons: { day: "slight-rain-showers.svg", night: "slight-rain-showers-night.svg" } },
    81 => { name: "Moderate Rain Showers", icons: { day: "rain-showers.svg", night: "rain-showers.svg" } },
    82 => { name: "Violent Rain Showers", icons: { day: "heavy-rain-showers.svg", night: "heavy-rain-showers.svg" } },
    85 => { name: "Light Snow Showers", icons: { day: "light-snow-showers.svg", night: "light-snow-showers.svg" } },
    86 => { name: "Heavy Snow Showers", icons: { day: "heavy-snow-showers.svg", night: "heavy-snow-showers.svg" } },
    95 => { name: "Thunderstorm", icons: { day: "thunderstorm.svg", night: "thunderstorm.svg" } },
    96 => { name: "Slight Hailstorm", icons: { day: "hail.svg", night: "hail.svg" } },
    99 => { name: "Heavy Hailstorm", icons: { day: "heavy-hail.svg", night: "heavy-hail.svg" } }
  }.freeze

  def weather_name(weather_code)
    WEATHER_CODES[weather_code]&.dig(:name) || "Unknown"
  end

  def weather_icon_path(weather_code, is_day)
    icon_set = WEATHER_CODES[weather_code]&.dig(:icons)
    icon_set[is_day == 1 ? :day : :night]
  end

  def wind_beaufort_scale(wind_speed)
    case wind_speed
    when 0..1.9 then "wind-beaufort-0.svg"
    when 2..5.9 then "wind-beaufort-1.svg"
    when 6..11.9 then "wind-beaufort-2.svg"
    when 12..19.9 then "wind-beaufort-3.svg"
    when 20..28.9 then "wind-beaufort-4.svg"
    when 29..38.9 then "wind-beaufort-5.svg"
    when 39..49.9 then "wind-beaufort-6.svg"
    when 50..61.9 then "wind-beaufort-7.svg"
    when 62..74.9 then "wind-beaufort-8.svg"
    when 75..88.9 then "wind-beaufort-9.svg"
    when 89..102.9 then "wind-beaufort-10.svg"
    when 103..117.9 then "wind-beaufort-11.svg"
    else "wind-beaufort-12.svg"
    end
  end
end
