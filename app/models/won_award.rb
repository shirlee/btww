class WonAward < ActiveRecord::Base
  
  belongs_to :team
  belongs_to :award
  
end
