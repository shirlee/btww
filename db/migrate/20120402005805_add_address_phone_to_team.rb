class AddAddressPhoneToTeam < ActiveRecord::Migration
  def change
    
    add_column :teams, :address_line_1, :string
    add_column :teams, :address_line_2, :string
    add_column :teams, :city, :string
    add_column :teams, :state, :string
    add_column :teams, :zip, :string
    add_column :teams, :phone, :string
    
  end
end
