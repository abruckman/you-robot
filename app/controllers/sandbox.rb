client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token= ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

user_tweets = []

client.user_timeline(screen_name: "libbycwatson", include_rts: false, count: 1000).each do |tweet|
   user_tweets << tweet.text
end
p user_tweets.length

user_tweets = user_tweets.join(" ").gsub(/http\S*\s/, "")

generator = MarkovChains::Generator.new(user_tweets)

tweets = generator.get_sentences(30)


tweets.each do |tweet|
  p tweet.length
end

result_tweet = tweets.find do |tweet|
  tweet.length.between?(100,140)
end

p result_tweet




