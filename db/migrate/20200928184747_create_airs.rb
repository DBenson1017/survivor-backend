class CreateAirs < ActiveRecord::Migration[6.0]
  def change
    create_table :airs do |t|
      t.string :air_quality
      t.string :quality_code
      t.string :quality_index
      t.string :city
      t.string :state
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
