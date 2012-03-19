class AddCalcsToTeam < ActiveRecord::Migration
  def change
    
    add_column :teams, :total_commutes, :integer
    add_column :teams, :mileage, :float
    add_column :teams, :commuters, :integer
    add_column :teams, :zero_commutes, :integer
    add_column :teams, :team_participation, :float
    add_column :teams, :newbies, :integer
    
  end
end