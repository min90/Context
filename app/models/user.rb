class User < ApplicationRecord
  has_one :arrival

  def arrived_color
    return '#f44242' if self.arrival.nil?
    if self.arrival.arrived
      '#41f49d'
    else
      '#f44242'
    end
  end

  def hash
    {"user": { name: name} }
  end
end
