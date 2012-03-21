# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Team.destroy_all
# 
# Team.create(:company => 'HomeFinder.com', :company_type => 'Business', :size => 72, :company_size_range => '51-100',
#             :website => 'http://www.homefinder.com', :twitter_handle => 'HomeFinder1')
# 
# Team.create(:company => 'Sparkfactor', :company_type => 'Business', :size => 4, :company_size_range => '1-5',
#             :website => 'http://www.sparkfactor.com', :twitter_handle => '@sparkfactor')
#             
# Team.create(:company => 'Code Academy', :company_type => 'Business', :size => 15, :company_size_range => '6-20',
#             :website => 'http://www.codeacademy.com', :twitter_handle => '@CodeAcademy')
# 
# Team.create(:company => 'GrubHub', :company_type => 'Business', :size => 250, :company_size_range => '101-300',
#             :website => 'http://www.grubhub.com', :twitter_handle => '@GrubHub')
#             
# Team.create(:company => 'Apartments.com', :company_type => 'Business', :size => 500, :company_size_range => '301-1000',
#             :website => 'http://www.apartments.com', :twitter_handle => '@AptsCom')
# 
# Team.create(:company => 'Cars.com', :company_type => 'Business', :size => 800, :company_size_range => '301-1000',
#             :website => 'http://www.cars.com', :twitter_handle => '@carsdotcom')
#             
# Team.create(:company => 'Orbitz', :company_type => 'Business', :size => 1400, :company_size_range => '1000+',
#             :website => 'http://www.codeacademy.com', :twitter_handle => '@Orbitz')
# 
# Team.create(:company => 'Chicago Coalition for the Homeless', :company_type => 'Non-Profit', :size => 45, :company_size_range => '21-50',
#             :website => 'http://www.chicagohomeless.org')
#             
# Team.create(:company => 'Jewish United Fund', :company_type => 'Non-Profit', :size => 99, :company_size_range => '51-100',
#             :website => 'http://www.juf.org/', :twitter_handle => '@JUFChicago')
#             
# puts "We now have #{Team.count} teams."


User.destroy_all

all_teams = Team.all
teams = Array.new
  all_teams.each do |team|
    teams << team.id
  end


User.create(:fname => 'Sara', :lname => 'Barley', 
            :isleader => true, :isadmin => true, :email => 'sara.barley@example.com', 
            :bikerclass => 'Commuter', :password => 'sbpassword', :password_confirmation => 'sbpassword',
            :team_id => teams[0])


User.create(:fname => 'Norton', :lname => 'Gamma',
            :isleader => false, :isadmin => false, :email => 'norton.gamma@example.com', 
            :bikerclass => 'Roadie', :password => 'ngpassword', :password_confirmation => 'ngpassword',
            :team_id => teams[1])


User.create(:fname => 'Rusty', :lname => 'Longs',
            :isleader => true, :isadmin => false, :email => 'rusty.longs@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'rlpassword', :password_confirmation => 'rlpassword',
            :team_id => teams[2])


User.create(:fname => 'George', :lname => 'Lapiz',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'george.lapiz@example.com', 
            :bikerclass => 'Recreational', :password => 'glpassword', :password_confirmation => 'glpassword',
            :team_id => teams[3])


User.create(:fname => 'Raul', :lname => 'Del Valle',
            :isleader => true, :isadmin => false, :email => 'raul.delvalle@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'rlpassword', :password_confirmation => 'rlpassword',
            :team_id => teams[4])


User.create(:fname => 'Greg', :lname => 'Lemon',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'greg.lemon@example.com', 
            :bikerclass => 'Recreational', :password => 'glpassword', :password_confirmation => 'glpassword',
            :team_id => teams[5])
            
User.create(:fname => 'Lynn', :lname => 'Happy', 
            :isleader => true, :isadmin => true, :email => 'lynn.happy@example.com', 
            :bikerclass => 'Commuter', :password => 'lhpassword', :password_confirmation => 'lhpassword',
            :team_id => teams[6])


User.create(:fname => 'Will', :lname => 'Feather',
            :isleader => false, :isadmin => false, :email => 'will.feather@example.com', 
            :bikerclass => 'Roadie', :password => 'wfpassword', :password_confirmation => 'wfpassword',
            :team_id => teams[7])


User.create(:fname => 'George', :lname => 'Manilow',
            :isleader => true, :isadmin => false, :email => 'george.manilow@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'gmpassword', :password_confirmation => 'gmpassword',
            :team_id => teams[8])


User.create(:fname => 'Chachee', :lname => 'Pigtails',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'chachee.pigtails@example.com', 
            :bikerclass => 'Recreational', :password => 'cppassword', :password_confirmation => 'cppassword',
            :team_id => teams[0])


User.create(:fname => 'Rolf', :lname => 'Amazing',
            :isleader => true, :isadmin => false, :email => 'rolf.amazing@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'rapassword', :password_confirmation => 'rapassword',
            :team_id => teams[0])


User.create(:fname => 'Boy', :lname => 'George',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'boy.george@example.com', 
            :bikerclass => 'Recreational', :password => 'bgpassword', :password_confirmation => 'bgpassword',
            :team_id => teams[1])

User.create(:fname => 'David', :lname => 'Smith',
            :isleader => true, :isadmin => false, :email => 'david.smith@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'dspassword', :password_confirmation => 'dspassword',
            :team_id => teams[2])


User.create(:fname => 'Alan', :lname => 'Wrench',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'alan.wrench@example.com', 
            :bikerclass => 'Recreational', :password => 'awpassword', :password_confirmation => 'awpassword',
            :team_id => teams[3])


User.create(:fname => 'Lonnie', :lname => 'Fonz',
            :isleader => true, :isadmin => false, :email => 'lonnie.fonz@example.com', 
            :bikerclass => 'Cycle-Crazed', :password => 'lfpassword', :password_confirmation => 'lfpassword',
            :team_id => teams[4])


User.create(:fname => 'Mark', :lname => 'Tyme',
            :isleader => false, :isadmin => false, :isnewbie => true, :email => 'mark.tyme@example.com', 
            :bikerclass => 'Recreational', :password => 'mtpassword', :password_confirmation => 'mtpassword',
            :team_id => teams[5])
            

puts "We now have #{User.count} users."


Commute.destroy_all

60.times do 
  
  users = User.all.shuffle
  
  c = Commute.new
  c.user_id = users.first.id
  c.commute_date = Time.parse("2012/02/#{rand(30) + 1}")
  c.distance = rand(40) + 1
  c.ridescore = 'Good'
  c.save
  team = Team.find(c.user.team_id)
  team.update_attributes(:mileage => team.mileage_calc,
                          :total_commutes => team.total_commutes_calc,
                          :commuters => team.commuters_calc,
                          :zero_commutes => team.zero_commutes_calc,
                          :team_participation => team.team_participation_calc,
                          :newbies => team.newbies_calc
                          )

end


  users = User.all
  
3.times do 
  
  users.each do |user|
    c = Commute.new
    c.user_id = user.id
    c.commute_date = Time.parse("2012/02/#{rand(30) + 1}")
    c.distance = rand(40) + 1
    c.ridescore = 'Good'
    c.save

    team = Team.find(c.user.team_id)
    team.update_attributes(:mileage => team.mileage_calc,
                            :total_commutes => team.total_commutes_calc,
                            :commuters => team.commuters_calc,
                            :zero_commutes => team.zero_commutes_calc,
                            :team_participation => team.team_participation_calc,
                            :newbies => team.newbies_calc
                            )

  end
end




puts "We now have #{Commute.count} commutes."


# Award.destroy_all

# consider this program to create every possible leaderboard.
# goal = ['Participation Rate', 'Number of Commutes', 'Number of Newbies', 'Total Mileage', 'Highest Mileage in One Day']
# comapny_type = ['Business', 'Non-Profit', 'Education', 'Bike-Related', 'Government', 'Transportation-Related']
# comapny_size_range = ['1-5', '6-20', '21-50', '51-100', '101-300', '301-1000', '1001+']
# g = 0
# ct = 0
# csr = 0
# 
# a = Award.new
# 
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1-5')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '6-20')
#             
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '21-50')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '51-100')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '101-300')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '301-1000')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1000+')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1-5')
# 
# Award.create(:goal => 'Number of Commutes',
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '6-20')
#             
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '21-50')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '51-100')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '101-300')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '301-1000')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1000+')
# 
# Award.create(:goal => 'Number of Newbies', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1-5')
# 
# Award.create(:goal => 'Number of Newbies', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '6-20')
#             
# Award.create(:goal => 'Number of Newbies',  
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '21-50')
# 
# Award.create(:goal => 'Number of Newbies',  
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '51-100')
# 
# Award.create(:goal => 'Number of Newbies',  
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '101-300')
# 
# Award.create(:goal => 'Number of Newbies',  
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '301-1000')
# 
# Award.create(:goal => 'Number of Newbies',  
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1000+')
# 
# Award.create(:goal => 'Number of Newbies', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1-5')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '6-20')
#             
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '21-50')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '51-100')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '101-300')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '301-1000')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Business',
#             :company_size_range => '1000+')
# 
# Award.create(:goal => 'Participation Rate', 
#             :isindividual => false, :isteam => true, :company_type => 'Non-Profit',
#             :company_size_range => '51-100')
# 
# Award.create(:goal => 'Number of Commutes', 
#             :isindividual => false, :isteam => true, :company_type => 'Non-Profit',
#             :company_size_range => '6-20')
#             
# Award.create(:goal => 'Number of Newbies', 
#             :isindividual => false, :isteam => true, :company_type => 'Non-Profit',
#             :company_size_range => '21-50')
# 
# Award.create(:goal => 'Total Mileage', 
#             :isindividual => false, :isteam => true, :company_type => 'Non-Profit',
#             :company_size_range => '51-100')
