ENV["RACK_ENV"] ||= "test"
require "rspec"
require "capybara/rspec"
require "sinatra"
require "csv"

require_relative "../server.rb"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('grocery_list.csv', 'w') { |file| file.puts(["name", "amount"]) }
  end

  config.after(:each) do
    CSV.open('grocery_list.csv', 'w') { |file| file.puts(["name", "amount"]) }
  end
end
