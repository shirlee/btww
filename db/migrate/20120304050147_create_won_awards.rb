class CreateWonAwards < ActiveRecord::Migration
  def change
    create_table :won_awards do |t|
      t.integer :award_id
      t.integer :team_id
      t.integer :user_id
      t.integer :year
      t.integer :place

      t.timestamps
    end
  end
end
