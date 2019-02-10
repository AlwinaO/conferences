class ConferencesController < ApplicationController

  # index route for all conferences
  get '/conferences' do
    redirect_if_not_logged_in
    @conferences = Conference.all
    erb :'/conferences/index'
  end

  # get conferences/new to render a form to create a new conference
  get '/conferences/new' do
    redirect_if_not_logged_in
    erb :'/conferences/new'
  end

  # post conferences to create a new conference
  post '/conferences' do
    # raise params.inspect
    # {"name"=>"Codeland", "location"=>"New York", "category"=>"Code Newbies", "date"=>"5/5/2019"}
    # create the entry if a user is logged in
    redirect_if_not_logged_in
    # save the entry if it has a name, location, category and date
    if params[:name] != "" && params[:location] != "" && params[:category] != "" && params[:date] != ""
      flash[:message] = "You have successfully created a new conference."
      @conference = Conference.create(name: params[:name], location: params[:location], category: params[:category], date: params[:date], user_id: current_user.id)
      redirect "/conferences/#{@conference.id}"
    else
      flash[:errors] = "Please complete all fields."
      redirect "conferences/new"
    end

  end

  # show route for one conference
  get '/conferences/:id' do
    set_conference_entry
    redirect_if_not_logged_in
    erb :'/conferences/show'
  end

  # route to edit a conference
  get '/conferences/:id/edit' do
    set_conference_entry
    redirect_if_not_logged_in
    redirect_if_not_authorized_to_edit(@conference)
    erb :'/conferences/edit'
    # if authorized_to_edit?(@conference)
    #   erb :'/conferences/edit'
    # else
    #   redirect "users/#{current_user.id}"
    # end
  end

  # this route updates the conference
  patch '/conferences/:id' do
    # find the conference
    set_conference_entry
    # modify the conference
    # binding.pry
    redirect_if_not_logged_in
    if authorized_to_edit?(@conference) && params[:name] != "" && params[:location] != "" && params[:category] != "" && params[:date] != ""
      @conference.update(name: params[:name], location: params[:location], category: params[:category], date: params[:date])
      redirect "/conferences/#{@conference.id}"
    else
      redirect "users/#{current_user.id}"
    end
  end


# route to delete a conference
  delete '/conferences/:id' do
    set_conference_entry
    if authorized_to_edit?(@conference)
      @conference.destroy
      flash[:message] = "The conference has been deleted."
      redirect "/conferences"
    else
      redirect "/conferences"
    end
  end

  private

  def set_conference_entry
    @conference = Conference.find_by(id: params[:id])
  end

end
