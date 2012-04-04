class Award < ActiveRecord::Base
  
  validates :goal, :company_type, :company_size_range, :presence => :true
  
  has_many :won_awards

  
end
