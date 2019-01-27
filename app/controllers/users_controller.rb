class UsersController < ApplicationController

  # Route for logging in
  get '/login' do
    erb :login

  end

  # receive the login the login form, find the user and log the user in (create a session)
  post '/login' do
    # find the user
    @user = User.find_by(email: params[:email])
    # authenticate the user - verify the user by email/pw combo
    if @user && @user.authenticate(params[:password])
    # log the user in - create the session
    # redirect to the user's landing page (show? index?  dashboard?)
      flash[:message] = "Welcome, #{@user.name}!"
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
    # tell the user they entered invalid credentials - add flash message
    flash[:errors] = "Your credentials were invalid. Please sign up or try again."
    # redirect to the login page
    redirect "/login"

    end
  end

  # Route for  signup
  # Render the signup form
  get '/signup' do
    erb :signup

  end

  post '/users' do
    # params will be {"name"=>"user", "email"=>"user@email.com", "password"=>"password"}
    # only persist new user with name, email and password
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.new(params)
      @user.save # persist the user to the database
      session[:user_id] = @user.id # login the user
      flash[:message] = "You have successfully created an account #{@user.name}! Welcome!"
      redirect "/users/#{@user.id}"
    else
      # not valid input
      # tell the user they entered invalid credentials - add flash message
      # redirect to the login page
      flash[:errors] = "Account creation failure. Please complete all fields."
      redirect "/signup"
    end

  end

  get '/users/:id' do
    # raise params.inspect
    @user = User.find_by(id: params[:id])
    # binding.pry
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
