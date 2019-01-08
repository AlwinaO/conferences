class UsersController < ApplicationController

  # Route for logging in
  get '/login' do
    erb :login

  end

  # receive the login the login form, find the user and log the user in (create a session)
  post '/login' do
    # find the user
    # authenticate the user
    # log the user in
    # redirect to the user's landing page (show? index?  dashboard?)
  end

  # Route for  signup
  get '/signup' do

  end

end
