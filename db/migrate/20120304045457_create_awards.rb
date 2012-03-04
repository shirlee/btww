class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :formula
      t.boolean :isindividual
      t.boolean :isteam
      t.string :company_type
      t.string :company_size_range

      t.timestamps
    end
  end
end
