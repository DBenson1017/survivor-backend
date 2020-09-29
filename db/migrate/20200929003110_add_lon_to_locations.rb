class AddLonToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :lon, :string
  end
end
