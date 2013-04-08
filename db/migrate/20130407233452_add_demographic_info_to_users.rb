class AddDemographicInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :ethnicity, :string
    add_column :users, :age_range, :string
    add_column :users, :home_zip_code, :string
    add_column :users, :work_zip_code, :string
  end
end
