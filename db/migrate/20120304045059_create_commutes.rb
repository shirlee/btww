class CreateCommutes < ActiveRecord::Migration
  def change
    create_table :commutes do |t|
      t.integer :user_id
      t.date :commute_date
      t.integer :sequence
      t.string :departure_address
      t.string :arrival_address
      t.float :distance
      t.string :ridescore
      t.text :comments

      t.timestamps
    end
  end
end
