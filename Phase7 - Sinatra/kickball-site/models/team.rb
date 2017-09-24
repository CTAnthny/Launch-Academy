require_relative "../lib/team_data"

class Team
  attr_reader :name
  TEAM_DATA = TeamData.to_h

  def initialize(name)
    @name = name
  end

  def self.all
    teams = []
    TEAM_DATA.each do |team, team_info|
      teams << Team.new(team)
    end
    teams
  end

  def players
    @players = []
    team_players = TEAM_DATA[@name]
    team_players.each do |position, player|
      @players << Player.new(player, position, @name)
    end
    @players
  end

  def positions
    @positions = []
    TEAM_DATA.each do |team, team_info|
      team_info.each do |position, player|
        @positions << position
      end
    break
    end
    @positions
  end
end
