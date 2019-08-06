class ChangeCompanyToCompanyNameInApplications < ActiveRecord::Migration[5.2]
  def change
    rename_column :applications, :company, :company_name
  end
end
