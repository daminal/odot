
class ZoneCoord < ActiveRecord::Model
  validates :lat, :lng, presence: true
end