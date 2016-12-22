
post '/robot' do

  #below works with properly formatted params in HTML form
  @robot = Robot.new(params[:robot]) #create new robot

  if @robot.save #saves new robot or returns false if unsuccessful
    redirect '/robot' #redirect back to robot index page
  else
    erb :'robot/new' # show new robot view again(potentially displaying errors)
  end

end
