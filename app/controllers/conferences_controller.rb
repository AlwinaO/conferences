class ConferencesController < ApplicationController

  # get conferences/new to render a form to create a new conference
  get '/conferences/new' do
    erb :'/conferences/new'
  end

  # post conferences to create a new conference
  post '/conferences' do
    # raise params.inspect
    # {"name"=>"Codeland", "location"=>"New York", "category"=>"Code Newbies", "date"=>"5/5/2019"}
    # create the entry if a user is logged in
    if !logged_in?
      redirect '/'
    # save the entry if it has a name, location, category and date
    elsif params[:name] != "" && params[:location] != "" && params[:category] != "" && params[:date] != ""
      @conference = Conference.create(params)
      redirect "/conferences/#{@conference.id}"
    end

  end

  # show route for one conference
  get '/conferences/:id' do
    erb :'/conferences/show'
  end

  # index route for all conferences
  get '/conferences' do
    erb :'/conferences/index'
  end


end
