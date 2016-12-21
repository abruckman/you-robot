class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :robot
  belongs_to :user
end
