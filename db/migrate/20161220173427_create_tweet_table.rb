class CreateTweetTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string   :content
      t.string   :comment
      t.string   :user_id
      t.string   :author_id null:false
  end
end
