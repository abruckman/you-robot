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
  @tweet.content = tweet
  if request.xhr?
    "*"*50
    erb :"/tweets/_show", {layout: false, locals: {:tweet => @tweet}}
  else
    if @tweet.save
      redirect "/robots/#{@robot.id}"
    else
      erb :'tweets/new' #show new tweets view again(potentially displaying errors)
    end
  end

end
