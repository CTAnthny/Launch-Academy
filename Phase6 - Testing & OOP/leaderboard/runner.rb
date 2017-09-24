require_relative "lib/leaderboard"

latest_board = Leaderboard.new
latest_board.draw_teams
latest_board.draw_stats
latest_board.sort
puts latest_board.display
