require 'pry'
require 'sinatra'
require 'sinatra/reloader'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get '/' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
    session[:player_score] = 0
    session[:computer_score] = 0
  else
    session[:visit_count] += 1
  end

  session[:output] = "Choose!"
  erb :index
end

get '/summary' do
  erb :summary
end

post '/' do
  score_round
  if session[:player_score] >= 3
    session[:final_output] = "Player has won the round with 3 wins!"
  elsif session[:computer_score] >= 3
    session[:final_output] = "Computer has won the round with 3 wins!"
  end
  redirect '/summary'
end

post '/summary' do
  if !session[:final_output].nil?
    session.clear
  end
  redirect '/'
end

post '/reset' do
  session.clear
  redirect '/'
end

def score_round
  @player_roll = params.to_a[0][0]

  roll_types = ["rock", "paper", "scissors"]
  @computer_roll = roll_types.sample

  session[:output] = "Player rolled #{@player_roll} and computer rolled #{@computer_roll}"
  if @player_roll == @computer_roll
    session[:output] << " - Tie!"
  elsif @player_roll == "rock" && @computer_roll == "scissors"
    session[:output] << " - Player wins!"
    session[:player_score] += 1
  elsif @player_roll == "rock" && @computer_roll == "paper"
    session[:output] << " - Computer wins!"
    session[:computer_score] += 1
  elsif @player_roll == "paper" && @computer_roll == "rock"
    session[:output] << " - Player wins!"
    session[:player_score] += 1
  elsif @player_roll == "paper" && @computer_roll == "scissors"
    session[:output] << " - Computer wins!"
    session[:computer_score] += 1
  elsif @player_roll == "scissors" && @computer_roll == "paper"
    session[:output] << " - Player wins!"
    session[:player_score] += 1
  elsif @player_roll == "scissors" && @computer_roll == "rock"
    session[:output] << " - Computer wins!"
    session[:computer_score] += 1
  end
end
