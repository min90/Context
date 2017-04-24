class Arrival < ApplicationRecord
  belongs_to :user

  def hash
    { "arrival": { user: user.name, arrived: arrived } }
  end

end
