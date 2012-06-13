class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :commutes
  belongs_to :team
  has_many :won_awards
  
  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  


  def full_name
    return fname + ' ' + lname
  end

  def commutes_that_count
    commutes.where(:commute_date => '2012-06-09'.. '2012-06-15')
  end

  def mileage
  mileage = 0
	  commutes_that_count.each do |commute|
					mileage = mileage + commute.mileage
		end
	return (mileage * 100).round.to_f / 100
  end

end
