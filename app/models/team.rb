class Team < ActiveRecord::Base
  
  has_many :users
  has_many :won_awards
  has_many :commutes, :through => :users
  
  validates :company, :presence => :true, :uniqueness => :true
  validates_inclusion_of :company_type, :in => %w(Business Non-Profit Education Bike-Related Government Transportation-Related), :message => " invalid company type"
  
  
  def self.search(search_name)
    if search_name
      find(:all, :conditions => ['company LIKE ?', "%#{search_name}%"])
    else
      find(:all)
    end
  end
  
  def company_size_range
    result = case size
      when 1..5 then '1-5'
      when 6..20 then '6-20'
      when 21..50 then '21-50'
      when 51..100 then '51-100'
      when 101..300 then '101-300'
      when 301..1000 then '101-300'
      else '1001+'
    end
    return result
  end
  
  
  def team_commutes
    commutes.count
  end


  def mileage
    miles = 0
		commutes.each do |commute|
					miles = miles + commute.mileage
		end
		return (miles * 100).round.to_f / 100
	end


  def team_commuters
    commutes.group('user_id').count.count
  end


  def team_participation
    return (((commutes.group('user_id').count.count).to_f / size) * 100).round(2)
  end

end
