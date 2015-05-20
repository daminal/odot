class Response < ActiveRecord::Base
  validates :phone_number, :lat, :lng, :value, presence: true

  def after_create
    zone = Zone.find_by_coords(lat, lng)

    if value
      zone.update_attributes('yes_count', zone.yes_count + 1)
    else
      zone.update_attributes('no_count', zone.no_count + 1)
    end
  end
end
