
get '/robots/new' do

  erb :'robots/_new' #show new robot view

end

post '/robots' do
  the_robot = Robot.find_by(handle: params[:robot][:handle] )
  p params
  if the_robot
    @robot = the_robot
    @robot.newClient
    @robot.create_library
  else
  #below works with properly formatted params in HTML form
    @robot = Robot.new(params[:robot])
    @robot.newClient
    @robot.create_library
    if @robot.save #saves new robot or returns false if unsuccessful
      redirect "/robots/#{@robot.id}" #redirect back to robot index page
    else
      erb :'robots/new' # show new robot view again(potentially displaying errors)
    end
  end
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


    # if get 'https://twitter.com/users/username_available?username=whatever'

    # p "^v"*50
    # p @robot.library
    # p "^v"*50



end


get '/robots/:id' do

  #gets params from url

  @robot = Robot.find(params[:id]) #define instance variable for view
  @tweets = @robot.tweets.reverse
  erb :'robots/show' #show single robot view

end
