require "sinatra"
require "pg"
require "pry"
require_relative "./app/models/article"

set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '',
    dbname: 'news_aggregator_development'
  }
end

configure :test do
  set :db_config, {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '',
    dbname: "news_aggregator_test"
  }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = db_connection do |conn|
    conn.exec("SELECT * FROM articles")
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
    db_connection do |conn|
      query = "INSERT INTO articles (title, article_url, description) VALUES ($1, $2, $3)"
      conn.exec_params(query, [params["title"], params["url"], params["description"]])
    end
    redirect '/articles'
  end

  # begin
    # db_connection do |conn|
    #   query = "INSERT INTO articles (title, article_url, description) VALUES ($1, $2, $3)"
    #   conn.exec_params(query, [params["title"], params["url"], params["description"]])
    # end
  # rescue PG::UNIQUEVIOLATION
  # end

  #redirect '/articles/news'
  #end
end

def check_url
  url_array = db_connection do |conn|
    conn.exec("SELECT article_url FROM articles")
  end
  url_array = url_array.values.flatten!
  if url_array != nil
    url_array.any? { |url| url == params['url'] }
  else
    false
  end
end
