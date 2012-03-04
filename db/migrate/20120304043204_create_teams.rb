class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :company
      t.string :company_type
      t.integer :size
      t.string :website

      t.timestamps
    end
  end
end
