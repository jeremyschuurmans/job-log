class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :company
      t.date :date
      t.boolean :followup, default: false
      t.text :response

      t.timestamps
    end
  end
end
