get '/robots/:robot_id/tweets' do

  @robot = Robot.find(params[:robot_id])

  @tweets = @robot.tweets

  erb :'tweets/index'

end

post '/robots/:robot_id/tweets' do

  @robot = Robot.find(params[:robot_id])

  @tweet = @robot.tweets.new()
  generator = MarkovChains::Generator.new(@robot.library)
  @tweet.user = current_user
  tweet = ''
  until tweet.length.between?(90,120)
    tweet = generator.get_sentences(1)
    tweet = tweet[0]
  end
  p tweet
  @tweet.content = tweet
  p "*" * 25
  p @tweet.content

  if @tweet.save
    redirect "/robots/#{@robot.id}"
  else
    erb :'tweets/new' #show new tweets view again(potentially displaying errors)
  end

end
