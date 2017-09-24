require "sinatra"
require "pry"
require_relative "models/player"
require_relative "models/team"

get "/" do
  redirect "/teams"
end

get "/teams" do
  @teams = Team.all
  # binding.pry
  erb :team_index
end

get "/teams/:team_name" do
  @teams = Team.all
  @team_name = params[:team_name]
  @team = @teams.find { |current_team| current_team.name == @team_name }
  @players = @team.players
  erb :team
end

get "/positions" do
  @teams = Team.all
  @positions = @teams[0].positions
  erb :position_index
end

get "/positions/:position" do
  @position = params[:position]
  @players = Player.all
  @selected_players = []
  @players.each do |player|
    if player.position == @position
      @selected_players << player
    end
  end
  erb :position
end
