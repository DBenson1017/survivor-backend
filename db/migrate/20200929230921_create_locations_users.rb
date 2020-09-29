class CreateLocationsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :locations_users do |t|
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
