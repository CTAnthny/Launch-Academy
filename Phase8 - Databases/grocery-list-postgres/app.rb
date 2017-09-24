require "sinatra"
require "pg"
require "pry"

configure :development do
  set :db_config, { dbname: "grocery_list_development" }
end

configure :test do
  set :db_config, { dbname: "grocery_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = db_connection do |conn|
    conn.exec("SELECT * FROM groceries")
  end
  erb :groceries
end

get "/groceries/:id" do
  item_id = params[:id].to_i
  db_connection do |conn|
    get_grocery_item_query = %(
      SELECT groceries.name, comments.comments
      FROM groceries
      LEFT OUTER JOIN comments ON groceries.id = comments.item_id
      WHERE groceries.id = $1
    )
  @grocery_item_info = conn.exec_params(get_grocery_item_query, [item_id])
  end
  erb :show_grocery_item
end

post "/groceries" do
  item_name = params[:name]

  if item_name == ""
    @@error_message = "Please enter an item name."
  else
    db_connection do |conn|
      insert_grocery_item_query = %(
        INSERT INTO groceries (name) VALUES ($1)
      )
      conn.exec_params(insert_grocery_item_query, [item_name])
    end
  end
  redirect "/groceries"
end
