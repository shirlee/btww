class RemoveIsLeaderFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :isleader
  end

  def down
    add_column :users, :isleader
  end
end
