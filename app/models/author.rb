class Author < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
end
