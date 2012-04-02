class AddContactShirtToTeam < ActiveRecord::Migration
  def change
    
    add_column :teams, :leader, :integer
    add_column :teams, :shirt, :boolean
    add_column :teams, :shirt_size, :string

  end
end
