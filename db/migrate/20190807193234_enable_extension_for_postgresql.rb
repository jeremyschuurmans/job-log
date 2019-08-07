class EnableExtensionForPostgresql < ActiveRecord::Migration[5.2]
  def self.up
    enable_extension "plpgsql"
  end
  def self.down
    disable_extension "plpgsql"
  end
end
