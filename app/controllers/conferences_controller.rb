class ConferencesController < ApplicationController

  # index route for all conferences
  get '/conferences' do
    @conferences = Conference.all
    erb :'/conferences/index'
  end

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
    end
    # save the entry if it has a name, location, category and date
    if params[:name] != "" && params[:location] != "" && params[:category] != "" && params[:date] != ""
      @conference = Conference.create(name: params[:name], location: params[:location], category: params[:category], date: params[:date], user_id: current_user.id)
      redirect "/conferences/#{@conference.id}"
    else
      redirect "conferences/new"
    end

  end

  # show route for one conference
  get '/conferences/:id' do
    @conference = Conference.find_by(id: params[:id])
    erb :'/conferences/show'
  end


end
