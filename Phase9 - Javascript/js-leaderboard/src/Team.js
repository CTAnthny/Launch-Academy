// YOUR CODE HERE
var Team = function (name, rank, wins, losses) {
  this.name = name;
  this.rank = rank || 0;
  this.wins = wins || 0;
  this.losses = losses || 0;
  // this.summar = function() ...
  return this;
}

Team.prototype.summary = function (array) {
  var output = "";
  var team_name = this.name;
  output += "Name: " + team_name;
  output += "\nRank: " + this.rank;
  output += "\nWins: " + this.wins;
  output += "\nLosses: " + this.losses;

  (function getGameData(array) {
    var game_data = "";
    var game_counter = 1;
    for (i = 0; i < array.length; i++) {
      if ( (array[i].home_team == team_name) || (array[i].away_team == team_name) ) {
        game_data += "\nGame " + game_counter + ": ";
        game_data += "\nHome Team: " + array[i].home_team + " | Away Team: " + array[i].away_team;
        game_data += "\nHome Score: " + array[i].home_score + " | Away Score: " + array[i].away_score;
        game_counter += 1;
      }
    }
    output += game_data;
  }(array));

  console.log(output);
  return output;
}
