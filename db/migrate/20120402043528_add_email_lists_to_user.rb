class AddEmailListsToUser < ActiveRecord::Migration
  def change
    
    add_column :teams, :btww_email_list, :boolean
    add_column :teams, :general_email_list, :boolean

  end
end
