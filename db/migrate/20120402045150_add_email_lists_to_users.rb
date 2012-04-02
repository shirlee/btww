class AddEmailListsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :btww_email_list, :boolean
    add_column :users, :general_email_list, :boolean
  end
end
