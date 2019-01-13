class ConferencesController < ApplicationController

  # get conferences/new to render a form to create a new conference
  get 'conferences/new' do
    erb :'/conferences/new'
  end

  # post conferences to create a new conference
  post '/conferences' do
    # redirect "/conferences/#{@conference.id}"
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
