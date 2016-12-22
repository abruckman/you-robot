class CreateTweetTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string   :content
      t.string   :comment
      t.integer   :user_id
      t.integer   :author_id null:false
  end
end
