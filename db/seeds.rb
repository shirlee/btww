# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.destroy_all

Team.create(:company => 'HomeFinder.com', :company_type => 'Business', :size => 72,
            :website => 'http://www.homefinder.com')

Team.create(:company => 'Sparkfactor', :company_type => 'Business', :size => 4,
            :website => 'http://www.sparkfactor.com')
            
puts "We now have #{Team.count} teams."


User.destroy_all

User.create(:fname => 'Shirlee', :lname => 'Berman', :team_id => 1,
            :isleader => true, :isadmin => true, :email => 'shirlee.berman@example.com', 
            :bikerclass => 'Commuter', :password => 'sbpassword', :password_confirmation => 'sbpassword')

User.create(:fname => 'Neil', :lname => 'Gallagher', :team_id => 1,
            :isleader => false, :isadmin => false, :email => 'neil.gallagher@example.com', 
            :bikerclass => 'Roadie', :password => 'ngpassword', :password_confirmation => 'ngpassword')

User.create(:fname => 'Russell', :lname => 'Lord', :team_id => 2,
            :isleader => true, :isadmin => false, :email => 'russell.lord@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'rlpassword', :password_confirmation => 'rlpassword')

User.create(:fname => 'George', :lname => 'Lowe', :team_id => 2,
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'george.lowe@example.com', 
            :bikerclass => 'Recreational', :password => 'glpassword', :password_confirmation => 'glpassword')

puts "We now have #{User.count} users."


Commute.destroy_all

10.times do 
  
  users = User.all.shuffle
  
  c = Commute.new
  c.user_id = users.first.id
  c.commute_date = Time.parse("2012/02/#{rand(30) + 1}")
    c.distance = rand(40) + 1 + rand
  c.ridescore = 'Good'
  c.save
  
end

puts "We now have #{Commute.count} commutes."
