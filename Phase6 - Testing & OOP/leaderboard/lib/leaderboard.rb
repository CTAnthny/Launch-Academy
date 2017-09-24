require 'pry'
require_relative "../spec/spec_helper"
require_relative "team"

class Leaderboard

  attr_reader :game_data

  GAME_INFO = [
      {
        home_team: "Patriots",
        away_team: "Broncos",
        home_score: 17,
        away_score: 13
      },
      {
        home_team: "Broncos",
        away_team: "Colts",
        home_score: 24,
        away_score: 7
      },
      {
        home_team: "Patriots",
        away_team: "Colts",
        home_score: 21,
        away_score: 17
      },
      {
        home_team: "Broncos",
        away_team: "Steelers",
        home_score: 11,
        away_score: 27
      },
      {
        home_team: "Steelers",
        away_team: "Patriots",
        home_score: 24,
        away_score: 31
      }
  ]

  #hold and display team objects w/ team stats
  def initialize(game_data = [])
    @game_data = game_data
  end

  #iterate through GAME_INFO and make a team object for each hash (team)
    # 1. create team object
  def draw_teams
    GAME_INFO.each do |game_hash|
      unless @game_data.any? { |team| team::name == game_hash[:home_team] }
        @game_data << Team.new(game_hash[:home_team])
      end

      unless @game_data.any? { |team| team::name == game_hash[:away_team] }
        @game_data << Team.new(game_hash[:away_team])
      end
    end
  end

    # 2. set wins/losses
  def draw_stats
    GAME_INFO.each do |game_hash|
      # if home team wins
      if game_hash[:home_score] > game_hash[:away_score]
        @game_data.each do |team|
          # increment home team win
          if team::name == game_hash[:home_team]
            team.wins += 1
          end

          # increment away team loss
          if team::name == game_hash[:away_team]
            team.losses += 1
          end
        end
      end

      # if away team wins
      if game_hash[:home_score] < game_hash[:away_score]
        @game_data.each do |team|
          # increment away team win
          if team::name == game_hash[:away_team]
            team.wins += 1
          end

          # increment home team loss
          if team::name == game_hash[:home_team]
            team.losses += 1
          end
        end
      end

    end
  end

    # 3. sort teams by wins
  def sort
    @game_data.sort! { |team| team::wins - team::losses }.reverse!
    @game_data.each_with_index do |team, index|
      team::rank = index + 1
    end
  end

    # 4. printer method
  def display
    output_string = ""
    output_string << "-" * 51
    # header
    output_string << "\n| Name       Rank     Total Wins     Total Losses |"
    # 1st team
    output_string << "\n| #{@game_data[0]::name}   #{@game_data[0]::rank}"
    output_string << "        #{@game_data[0]::wins}"
    output_string << "              #{@game_data[0]::losses}            |"
    # 2nd team
    output_string << "\n| #{@game_data[1]::name}   #{@game_data[1]::rank}"
    output_string << "        #{@game_data[1]::wins}"
    output_string << "              #{@game_data[1]::losses}            |"
    # 3rd team
    output_string << "\n| #{@game_data[2]::name}    #{@game_data[2]::rank}"
    output_string << "        #{@game_data[2]::wins}"
    output_string << "              #{@game_data[2]::losses}            |"
    # 4th team
    output_string << "\n| #{@game_data[3]::name}      #{@game_data[3]::rank}"
    output_string << "        #{@game_data[3]::wins}"
    output_string << "              #{@game_data[3]::losses}            |\n"
    output_string << "-" * 51
  end
end
