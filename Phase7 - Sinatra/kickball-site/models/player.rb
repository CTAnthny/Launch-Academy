require_relative "../lib/team_data"

class Player
  attr_reader :name, :position, :team_name
  TEAM_DATA = TeamData.to_h

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    @players = []
    TEAM_DATA.each do |team, team_info|
      team_info.each do |position, player|
        @players << Player.new(player, position, team)
      end
    end
    @players
  end
end
