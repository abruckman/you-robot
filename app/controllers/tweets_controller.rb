get '/robots/:robot_id/tweets' do

  @robot = Robot.find(params[:robot_id])

  @tweets = @robot.tweets

  erb :'tweets/index'

end

post '/robots/:robot_id/tweets' do

  @robot = Robot.find(params[:robot_id])
  p @robot
  p @robot.library
  @tweet = @robot.new_tweet
  if request.xhr?
    @tweet.save
    erb :"/tweets/_show", {layout: false, locals: {:tweet => @tweet}}
  else
    if @tweet.save
      redirect "/robots/#{@robot.id}"
    else
      erb :'tweets/new' #show new tweets view again(potentially displaying errors)
    end
  end

end
