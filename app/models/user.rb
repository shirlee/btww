class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :commutes
  belongs_to :team
  has_many :won_awards
  
  validates :email, :presence => :true
  
  
  def mileage
  mileage = 0
	  commutes.each do |commute|
					mileage = mileage + commute.mileage
		end
	return (mileage * 100).round.to_f / 100
  end


end
