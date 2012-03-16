class AddGoalToAwards < ActiveRecord::Migration
  def change
      add_column :awards, :goal, :string
  end
end
