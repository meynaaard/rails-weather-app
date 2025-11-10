class Forecast < ApplicationRecord
  belongs_to :location

  def current_time_in_zone
    Time.zone = self.location.timezone
    current_time = Time.zone.now.to_s
    Time.parse(current_time).strftime("%H:%M")
  end
end
