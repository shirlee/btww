class AddCompanySizeRangeToTeam < ActiveRecord::Migration
  def change
      add_column :teams, :company_size_range, :string  
  end
end
