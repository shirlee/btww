class Award < ActiveRecord::Base
  
  validates :goal, :company_type, :company_size_range, :presence => :true
  validates_inclusion_of :company_type, :in => %w(Business Non-Profit Education Bike-Related Government Transportation-Related), :message => " invalid Company Type"
  
  has_many :won_awards

  
end
