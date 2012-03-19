class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :commutes
  belongs_to :team
  has_many :won_awards
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  def mileage
  mileage = 0
	  commutes.each do |commute|
					mileage = mileage + commute.mileage
		end
	return (mileage * 100).round.to_f / 100
  end

  def full_name
    return fname + ' ' + lname
  end

end
