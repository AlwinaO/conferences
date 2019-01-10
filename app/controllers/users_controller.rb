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
    if @user.authenticate(params[:password])
    # log the user in - create the session
    # redirect to the user's landing page (show? index?  dashboard?)
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
    # tell the user they entered invalid credentials
    # redirect to the login page
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
    if params[:name] != "" && params[:email] != "" && params[:name] != ""
      @user = User.new(params)
      redirect "/users/#{@user.id}"
    else
      # not valid input
    end

  end

  get '/users/:id' do
    "this is the user's show page"

  end



end
