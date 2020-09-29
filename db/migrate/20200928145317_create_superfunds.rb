class CreateSuperfunds < ActiveRecord::Migration[6.0]
  def change
    create_table :superfunds do |t|
      t.references :location
      t.string :name
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :state

      t.timestamps
    end
  end
end
