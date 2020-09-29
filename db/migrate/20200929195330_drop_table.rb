class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :saveds
  end
end
