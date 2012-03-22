class Commute < ActiveRecord::Base
  
  validates :commute_date, :distance, :presence => :true
  
  belongs_to :user
  
  
  def mileage
    (self.distance * 100).round.to_f / 100
  end
  
end
