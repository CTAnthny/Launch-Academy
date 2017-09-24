require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order('title ASC')
  erb :'meetups/index'
end

post '/meetups' do
  @meetup = Meetup.new(params[:meetup])

  session[:title] = params[:meetup][:title]
  session[:description] = params[:meetup][:description]
  @current_user = current_user

  if current_user.nil?
    flash[:notice] = "You must sign in first to create a meetup!"
    erb :new
  else
    @meetup.creator = current_user
    if @meetup.save
      flash[:notice] = "You have successfully created this meetup!"
      # add creator to members list
      Registration.create(user_id: @current_user.id, meetup_id: @meetup.id)
      redirect "/meetups/#{@meetup.id}"
    else
      if @meetup.errors.any?
        @meetup.errors.messages.each do |atr, msg|
          flash[:notice] = "#{atr} #{msg[0]}"
        end
      end
      erb :new
    end
  end
end

get '/meetups/new' do
  @meetup = Meetup.new

  @new_title = session[:title]
    session[:title] = nil
  @new_description = session[:description]
    session[:description] = nil

  erb :new
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  @current_user = current_user

  erb :show
end

get '/meetups/:id/join' do
  # find the meetup based on params[:id]
  @meetup = Meetup.find(params[:id])

  # use current_user to grab the signed in user
  @current_user = current_user

  if @current_user.nil?
    flash[:notice] = "You must sign in first to join this meetup!"
    erb :show
  else
  # create a Registration object with meetup and user
    @registration = Registration.new(user_id: @current_user.id, meetup_id: @meetup.id)
    if @registration.save
      flash[:notice] = "You have successfully joined this meetup!"
      redirect "/meetups/#{@meetup.id}"
    end
  end

  # redirect them back to the show page
  redirect "/meetups/#{@meetup.id}"
end
