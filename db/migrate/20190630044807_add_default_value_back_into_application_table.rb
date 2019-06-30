class AddDefaultValueBackIntoApplicationTable < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:applications, :followup, false)
  end
end
