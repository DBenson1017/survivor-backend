class CreatJoinTableUserLocation < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :locations do |t|
      # t.index [:user_id, :location_id]
      # t.index [:location_id, :user_id]
    end
  end
end
