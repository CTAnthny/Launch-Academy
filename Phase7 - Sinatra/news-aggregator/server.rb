require 'sinatra'
require 'csv'
require 'pry'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = []
  CSV.foreach('articles.csv', headers: true, header_converters: :symbol) do |row|
    @articles << row.to_hash
  end
  erb :index
end

get '/articles/new' do
  erb :new
end

post '/articles' do
  title = params['title']
  url = params['url']
  description = params['description']

  if title == "" || url == "" || description == ""
    @error_message = "Invalid input!"
    erb :new
  elsif description.length < 20
    @error_message = "Invalid description!"
    erb :new
  elsif !url.include?("https://")
    @error_message = "Invalid url!"
    erb :new
  elsif check_url
    @error_message = "Duplicate URL!"
    erb :new
  else
    CSV.open('articles.csv', 'a') do |csv|
      csv << [title, url, description]
    end

    redirect '/articles'
  end
end

def check_url
  url_array = []
  CSV.foreach('articles.csv') do |row|
    url_array.push(row[1])
  end
  url_array.any? { |url| url == params['url'] }
end
