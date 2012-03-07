class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :commutes
  belongs_to :team
  
  validates :email, :presence => :true
  
end
