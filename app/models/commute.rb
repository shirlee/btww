class Commute < ActiveRecord::Base
  
  belongs_to :user
  
  
  def mileage
    (self.distance * 100).round.to_f / 100
  end
  
end
