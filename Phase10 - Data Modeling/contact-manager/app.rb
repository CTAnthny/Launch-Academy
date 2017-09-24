require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/:id' do
  pk_id = params[:id]
  @contact = Contact.find(pk_id)
  erb :show
end
