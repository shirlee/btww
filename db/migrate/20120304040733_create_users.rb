class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :team_id
      t.boolean :isleader
      t.boolean :isadmin
      t.boolean :isnewbie
      t.string :email
      t.string :bikerclass

      t.timestamps
    end
  end
end
