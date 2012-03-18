class Team < ActiveRecord::Base
  
  has_many :users
  has_many :won_awards
  has_many :commutes, :through => :users
  
  validates :company, :presence => :true, :uniqueness => :true
  validates_inclusion_of :company_type, :in => %w(Business Non-Profit Education Bike-Related Government Transportation-Related), :message => " invalid company type"
  
  
  def self.search(search_name)
    if search_name
      find(:all, :conditions => ['UPPER(company) LIKE ?', "%#{search_name.upcase}%"])
    else
      find(:all)
    end
  end
  
  
  def total_commutes
    commutes.count
  end


  def mileage
    miles = 0
		commutes.each do |commute|
					miles = miles + commute.mileage
		end
		return (miles * 100).round.to_f / 100
	end


  def commuters
    commutes.group('user_id').count.count
  end


  def zero_commutes
    return users.count - commuters
  end


  def team_participation
    return (((commutes.group('user_id').count.count).to_f / size) * 100).round(2)
  end

  def newbies
    newbies = 0
    users.each do |user|
      if user.isnewbie
          newbies = newbies + 1
      end
    end
    return newbies
  end

end
