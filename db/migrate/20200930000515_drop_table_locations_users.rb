class DropTableLocationsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :locations_users
  end
end
