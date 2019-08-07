class ChangeStringDatatypeToHstoreForAddressInCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :address, 'hstore USING address::hstore'
  end
end
