class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :telephone_number
      t.string :contact_person
      t.integer :user_id
      t.integer :application_id

      t.timestamps
    end
  end
end
