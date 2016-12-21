class CreateRobotTable < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string   :handle
      t.string   :library

      t.timestamps null:false
    end
  end
end
