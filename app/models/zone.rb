class Zone < ActiveRecord::Model
  has_many :zone_coords

  def total
    yes_count + no_count
  end

  def percentage
    if total > 0
      yes_count / total
    else
      0
    end
  end
end