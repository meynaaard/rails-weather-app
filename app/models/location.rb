class Location < ApplicationRecord
  has_many :forecasts, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
