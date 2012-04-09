class Team < ActiveRecord::Base
  
  has_many :users
  has_many :won_awards
  has_many :commutes, :through => :users
  
  validates :company, :presence => :true, :uniqueness => :true
  validates :company_type, :size, :leader, :address_line_1, :city, :state, :zip, :phone, :presence => :true
  validates :size, :numericality => { :greater_than_or_equal_to => 5 }
  
  
  def self.search(search_name)
    if search_name
      find(:all, :conditions => ['UPPER(company) LIKE ?', "%#{search_name.upcase}%"], :order => 'company asc')
    else
      find(:all, :order => 'company asc')
    end
  end
  
  def commutes_that_count
    commutes.where(:commute_date => '2012-06-09'..'2012-06-15')
  end
  
  def total_commutes_calc
    commutes_that_count.count
  end


  def mileage_calc
    miles = 0
		commutes_that_count.each do |commute|
					miles = miles + commute.mileage
		end
		return (miles * 100).round.to_f / 100
	end


  def commuters_calc
    commutes_that_count.group('user_id').count.count
  end
  
  def zero_commutes_calc
    zero_commutes_calc = users.count - (commutes_that_count.group('user_id').count.count)
      if zero_commutes_calc == nil
        return 0
      else
      end
    return zero_commutes_calc
  end


  def team_participation_calc
    return (((commutes_that_count.group('user_id').count.count).to_f / size) * 100).round(2)
  end

  def newbies_calc
    newbies = 0
    users.each do |user|
      if user.isnewbie && user.commutes_that_count.count >0
          newbies = newbies + 1
      end
    end
    return newbies
  end
  

end
