
get '/robots/new' do

  erb :'robots/_new' #show new robot view

end

post '/robots' do
  the_robot = Robot.find_by(handle: params[:robot][:handle] )
  if the_robot
    redirect "/robots/#{the_robot.id}"
  else
  #below works with properly formatted params in HTML form
    @robot = Robot.new(params[:robot])
    @robot.newClient #create new robot
    @robot.create_library

    # if get 'https://twitter.com/users/username_available?username=whatever'

    # p "^v"*50
    # p @robot.library
    # p "^v"*50

    if @robot.save #saves new robot or returns false if unsuccessful
      redirect "/robots/#{@robot.id}" #redirect back to robot index page
    else
      erb :'robots/new' # show new robot view again(potentially displaying errors)
    end
  end

end


get '/robots/:id' do

  #gets params from url

  @robot = Robot.find(params[:id]) #define instance variable for view
  @tweets = @robot.tweets.reverse
  erb :'robots/show' #show single robot view

end
