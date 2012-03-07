class Award < ActiveRecord::Base
  
  has_many :won_awards
  
end
