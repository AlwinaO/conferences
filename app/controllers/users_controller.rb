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

  get '/users/:id' do
    "this is the user's show page"

  end

  # Route for  signup
  get '/signup' do

  end

end
