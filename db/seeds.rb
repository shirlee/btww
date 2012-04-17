# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# 
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 



User.destroy_all


User.create(:fname => 'Sara', :lname => 'Barley', 
            :isadmin => true, :email => 'sara.barley@example.com', 
            :bikerclass => 'Commuter/Transportation', :password => 'sbpassword', :password_confirmation => 'sbpassword')


User.create(:fname => 'Norton', :lname => 'Gamma',
            :isadmin => false, :email => 'norton.gamma@example.com', 
            :bikerclass => 'Roadie', :password => 'ngpassword', :password_confirmation => 'ngpassword')


User.create(:fname => 'Rusty', :lname => 'Longs',
            :isadmin => false, :email => 'rusty.longs@example.com', 
            :bikerclass => 'Commuter/Transportation', :password => 'rlpassword', :password_confirmation => 'rlpassword')


User.create(:fname => 'George', :lname => 'Lapiz',
            :isadmin => false, :isnewbie => true, :email => 'george.lapiz@example.com', 
            :bikerclass => 'Recreational', :password => 'glpassword', :password_confirmation => 'glpassword')


User.create(:fname => 'Raul', :lname => 'Del Valle',
            :isadmin => false, :email => 'raul.delvalle@example.com', 
            :bikerclass => 'BMX', :password => 'rdvpassword', :password_confirmation => 'rdvpassword')


User.create(:fname => 'Greg', :lname => 'Lemon',
            :isadmin => false, :isnewbie => true, :email => 'greg.lemon@example.com', 
            :bikerclass => 'Recreational', :password => 'glpassword', :password_confirmation => 'glpassword')
            
User.create(:fname => 'Lynn', :lname => 'Happy', 
            :isadmin => true, :email => 'lynn.happy@example.com', 
            :bikerclass => 'Commuter/Transportation', :password => 'lhpassword', :password_confirmation => 'lhpassword')


User.create(:fname => 'Will', :lname => 'Feather',
            :isadmin => false, :email => 'will.feather@example.com', 
            :bikerclass => 'Roadie', :password => 'wfpassword', :password_confirmation => 'wfpassword')


User.create(:fname => 'George', :lname => 'Manilow',
            :isadmin => false, :email => 'george.manilow@example.com', 
            :bikerclass => 'MTB/Cross', :password => 'gmpassword', :password_confirmation => 'gmpassword')


User.create(:fname => 'Chachee', :lname => 'Pigtails',
            :isadmin => false, :isnewbie => true, :email => 'chachee.pigtails@example.com', 
            :bikerclass => 'Recreational', :password => 'cppassword', :password_confirmation => 'cppassword')


User.create(:fname => 'Rolf', :lname => 'Amazing',
            :isadmin => false, :email => 'rolf.amazing@example.com', 
            :bikerclass => 'MTB/Cross', :password => 'rapassword', :password_confirmation => 'rapassword')


User.create(:fname => 'Boy', :lname => 'George',
            :isadmin => false, :isnewbie => true, :email => 'boy.george@example.com', 
            :bikerclass => 'Recreational', :password => 'bgpassword', :password_confirmation => 'bgpassword')

User.create(:fname => 'David', :lname => 'Smith',
            :isadmin => false, :email => 'david.smith@example.com', 
            :bikerclass => 'BMX', :password => 'dspassword', :password_confirmation => 'dspassword')


User.create(:fname => 'Alan', :lname => 'Wrench',
            :isadmin => false, :isnewbie => true, :email => 'alan.wrench@example.com', 
            :bikerclass => 'Recreational', :password => 'awpassword', :password_confirmation => 'awpassword')


User.create(:fname => 'Lonnie', :lname => 'Fonz',
            :isadmin => false, :email => 'lonnie.fonz@example.com', 
            :bikerclass => 'Roadie', :password => 'lfpassword', :password_confirmation => 'lfpassword')


User.create(:fname => 'Mark', :lname => 'Tyme',
            :isadmin => false, :isnewbie => true, :email => 'mark.tyme@example.com', 
            :bikerclass => 'Recreational', :password => 'mtpassword', :password_confirmation => 'mtpassword')
            

puts "We now have #{User.count} users."




Team.destroy_all

all_users = User.all
users = Array.new
  all_users.each do |user|
    users << user
  end


Team.create(:company => 'HomeFinder.com', :company_type => 'Business/Non-Profit', :size => 72, 
            :website => 'http://www.homefinder.com', :twitter_handle => 'HomeFinder1', :leader => users[0].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[0].update_attributes(:team_id => Team.last.id)


Team.create(:company => 'Sparkfactor', :company_type => 'Business/Non-Profit', :size => 4, 
            :website => 'http://www.sparkfactor.com', :twitter_handle => '@sparkfactor', :leader => users[1].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[1].update_attributes(:team_id => Team.last.id)

Team.create(:company => 'Code Academy', :company_type => 'Business/Non-Profit', :size => 15, 
            :website => 'http://www.codeacademy.com', :twitter_handle => '@CodeAcademy', :leader => users[2].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[2].update_attributes(:team_id => Team.last.id)
            
Team.create(:company => 'GrubHub', :company_type => 'Business/Non-Profit', :size => 250, 
            :website => 'http://www.grubhub.com', :twitter_handle => '@GrubHub', :leader => users[3].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[3].update_attributes(:team_id => Team.last.id)
                        
Team.create(:company => 'Apartments.com', :company_type => 'Business/Non-Profit', :size => 500, 
            :website => 'http://www.apartments.com', :twitter_handle => '@AptsCom', :leader => users[4].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[4].update_attributes(:team_id => Team.last.id)
            
Team.create(:company => 'Cars.com', :company_type => 'Business/Non-Profit', :size => 800, 
            :website => 'http://www.cars.com', :twitter_handle => '@carsdotcom', :leader => users[5].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[5].update_attributes(:team_id => Team.last.id)
                        
Team.create(:company => 'Orbitz', :company_type => 'Business/Non-Profit', :size => 1400, 
            :website => 'http://www.codeacademy.com', :twitter_handle => '@Orbitz', :leader => users[6].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[6].update_attributes(:team_id => Team.last.id)
            
Team.create(:company => 'Chicago Coalition for the Homeless', :company_type => 'Business/Non-Profit', :size => 45,
            :website => 'http://www.chicagohomeless.org', :leader => users[7].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[7].update_attributes(:team_id => Team.last.id)
                        
Team.create(:company => 'Jewish United Fund', :company_type => 'Business/Non-Profit', :size => 99, 
            :website => 'http://www.juf.org/', :twitter_handle => '@JUFChicago', :leader => users[8].id,
            :address_line_1 => '175 W Jackson', :city => 'Chicago', :state => 'IL', :zip => '60642', :phone => '312.555.5555')
users[8].update_attributes(:team_id => Team.last.id)
                        
puts "We now have #{Team.count} teams."

teams = Team.all
teams.each do |team|
  company_size_range = case team.size
    when 1..4 then '1-4'
    when 5..24 then '5-24'
    when 25..99 then '25-99'
    when 100..499 then '100-499'
    else '500+'
  end
  team.update_attributes(:company_size_range => company_size_range)
end

teams_with_nil_size_range = Team.where(:company_size_range => nil).count
teams_with_blank_size_range = Team.where(:company_size_range => "").count

puts "There are #{teams_with_nil_size_range} plus #{teams_with_blank_size_range} teams with no size range.  0 sum is good."


puts "Our array of User objects is #{users}"

all_teams = Team.all
teams = Array.new
  all_teams.each do |team|
    teams << team.id
  end

  
puts "Our array of Team ID's is #{teams}"

users[9].update_attributes(:team_id => teams[1])
users[10].update_attributes(:team_id => teams[2])
users[11].update_attributes(:team_id => teams[3])
users[12].update_attributes(:team_id => teams[4])
users[13].update_attributes(:team_id => teams[0])
users[14].update_attributes(:team_id => teams[1])
users[15].update_attributes(:team_id => teams[2])

puts "All our Users should now have Teams."

Commute.destroy_all

60.times do 
  
  users = User.all.shuffle
  
  c = Commute.new
  c.user_id = users.first.id
  c.commute_date = Time.parse("2012/06/#{rand(30) + 1}")
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
    c.commute_date = Time.parse("2012/05/#{rand(30) + 1}")
    c.distance = rand(40) + 1
    c.ridescore = 'Fan-freakin-tastic'
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


Award.destroy_all


Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '1-4')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '5-24')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '100-499')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '500+')

            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '1-4')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '5-24')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '100-499')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Business/Non-Profit',
            :company_size_range => '500+')


Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '1-4')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '5-24')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '25-99')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '100-499')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '500+')


Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '25-99')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '500+')


Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '25-99')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '500+')


Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '1-4')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '5-24')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '25-99')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '100-499')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Public Agency',
            :company_size_range => '500+')


Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '1-4')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '5-24')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '100-499')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '500+')

            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '1-4')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '5-24')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '100-499')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'Bicycle-related Business',
            :company_size_range => '500+')


Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '1-4')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '5-24')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '100-499')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '500+')

            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '1-4')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '5-24')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '100-499')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'K-12 School',
            :company_size_range => '500+')


Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '1-4')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '5-24')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '100-499')

Award.create(:goal => 'Participation Rate', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Commutes', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '500+')

            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '1-4')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '5-24')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '100-499')

Award.create(:goal => 'Number of Newbies', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '500+')

            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '1-4')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '5-24')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '25-99')
            
Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '100-499')

Award.create(:goal => 'Total Mileage', 
            :isindividual => false, :isteam => true, :company_type => 'College/University',
            :company_size_range => '500+')


puts "We now have #{Award.count} awards. I expected 5x5x4=100"
