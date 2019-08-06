class RemoveUserIdAndApplicationIdFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :user_id, :integer
    remove_column :companies, :application_id, :integer
  end
end
