require 'sinatra'
require 'csv'
require 'pry'
require_relative "app/models/television_show"

set :views, File.join(File.dirname(__FILE__), "app/views")

get '/' do
  redirect '/television_shows'
end

get '/television_shows' do
  @shows = []
  CSV.foreach('television-shows.csv', headers: true, header_converters: :symbol) do |row|
    @shows << row.to_hash
  end
  erb :index
end

get '/television_shows/new' do
  erb :new
end

post '/television_shows' do
  redirect '/television_shows/new'
end

post '/television_shows/new' do
  title = params['title']
  network = params['network']
  year = params['year']
  synopsis = params['synopsis']
  genre = params['genre']

  if title == "" || network == "" || year == "" || synopsis == ""
    @error_message = "Error! Please fill in all required fields."
    erb :new
  elsif check_duplicate?
    @error_message = "Error! This show has already been submitted."
    erb :new
  else
    CSV.open('television-shows.csv', 'a') do |csv|
      csv << [title, network, year, synopsis, genre]
    end
    redirect 'television_shows'
  end
end

def check_duplicate?
  title_array = []
  CSV.foreach('television-shows.csv') do |row|
    title_array.push(row[0])
  end
  title_array.any? { |title| title == params['title'] }
end
