class AddAppliedBooleanToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :applied, :boolean, default: false
  end
end
