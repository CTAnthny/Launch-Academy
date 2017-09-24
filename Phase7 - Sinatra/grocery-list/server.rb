require 'sinatra'
require 'csv'
require 'pry'

set :views, File.join(File.dirname(__FILE__), "app/views")

get '/' do
  redirect '/groceries'
end

get '/groceries' do
  # get grocery list
  read_list
  erb :index
end

# get '/groceries/:item_name' do
#   @item_name = params[:item_name]
#   check_for_item
#   erb :item
# end

post '/groceries' do
  grocery_item = params["item_name"]
  item_amount = params["amount"]
  read_list

  if grocery_item == "" || grocery_item.nil?
    @error_message = "Please enter an item name."
    erb :index
  else
    CSV.open('grocery_list.csv', 'a') do |csv|
      csv << [grocery_item, item_amount]
    end
    redirect '/groceries'
  end
end

def read_list
  @groceries = []
  CSV.foreach('grocery_list.csv', headers: true, header_converters: :symbol) do |row|
    @groceries << row.to_hash
  end
end

# def check_for_item
#   read_list
#   @groceries.each do |item, amount|
# end
