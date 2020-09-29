class AddLatToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :lat, :string
  end
end
