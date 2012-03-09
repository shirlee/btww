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
  
  
end
