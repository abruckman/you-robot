class Robot < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  def newClient
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token= ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end
  def create_library
    user_tweets = []

    @client.user_timeline(screen_name: self.handle, include_rts: false, count: 1000).each do |tweet|
       user_tweets << tweet.text
    end
    user_tweets.length

    self.library = user_tweets.join(" ").gsub(/http\S*\s/, "")
    self.library
  end
end