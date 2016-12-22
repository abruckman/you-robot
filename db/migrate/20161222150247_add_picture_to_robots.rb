class AddPictureToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :image_url, :string 
  end
end
