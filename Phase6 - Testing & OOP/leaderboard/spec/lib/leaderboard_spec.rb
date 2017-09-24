require_relative '../spec_helper'

RSpec.describe Leaderboard do
  let(:board) { Leaderboard.new }
  let(:teams_drawn) { Leaderboard.new }
  let(:stats_drawn) { Leaderboard.new }
  let(:sorted_board) { Leaderboard.new }

  before(:each) do
    teams_drawn.draw_teams

    stats_drawn.draw_teams
    stats_drawn.draw_stats

    sorted_board.draw_teams
    sorted_board.draw_stats
    sorted_board.sort
  end

  describe ".new" do
    it "should create a game data array" do
      expect(Leaderboard.new).to be_a(Leaderboard)
    end
  end

  describe "#draw_teams" do
    it "should iterate through GAME_INFO and create a team object for each home team" do
      expect(teams_drawn.game_data[0]::name).to eq("Patriots")
    end

    it "should iterate through GAME_INFO and create a team object for each away team" do
      expect(teams_drawn.game_data[2]::name).to eq("Colts")
    end
  end

  describe "#draw_stats" do
    it "should iterate through GAME_INFO and add a win for :home_team" do
      expect(stats_drawn.game_data[0]::wins).to eq(3)
    end

    it "should iterate through GAME_INFO and add a win for :away_team" do
      expect(stats_drawn.game_data[1]::wins).to eq(1)
    end

    it "should iterate through GAME_INFO and add a loss for :home_team" do
      expect(stats_drawn.game_data[2]::losses).to eq(2)
    end

    it "should iterate through GAME_INFO and add a loss for :away_team" do
      expect(stats_drawn.game_data[3]::losses).to eq(1)
    end
  end

  describe "#sort" do
    it "should sort teams descending in @game_data according to most wins and least losses" do
      expect(sorted_board.game_data[1]::name).to eq("Steelers")
    end

    it "should rank the teams" do
      expect(sorted_board.game_data[3]::rank).to eq(4)
    end
  end

  describe "#display" do
    it "should have print out leaderboard with header 'Name'" do
      expect(sorted_board.display).to include("Name")
    end

    it "should have print out leaderboard with header 'Rank'" do
      expect(sorted_board.display).to include("Rank")
    end
  end
end
