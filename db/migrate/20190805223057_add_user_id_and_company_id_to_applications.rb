class AddUserIdAndCompanyIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :user_id, :integer
    add_column :applications, :company_id, :integer
  end
end
