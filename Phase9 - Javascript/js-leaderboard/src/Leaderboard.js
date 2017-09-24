var gameInfo = [
   {
     home_team: "Patriots",
     away_team: "Broncos",
     home_score: 7,
     away_score: 3
   },
   {
     home_team: "Broncos",
     away_team: "Colts",
     home_score: 3,
     away_score: 0
   },
   {
     home_team: "Patriots",
     away_team: "Colts",
     home_score: 11,
     away_score: 7
   },
   {
     home_team: "Steelers",
     away_team: "Patriots",
     home_score: 7,
     away_score: 21
   }
 ];

var leaderboardTeamsArray = [];
function getTeamNames(array) {
  var teamNames = [];
  for (i = 0; i < array.length; i++) {
    var homeTeamName = array[i].home_team;
    var awayTeamName = array[i].away_team;
    if (!teamNames.includes(homeTeamName)) {
      var homeTeam = new Team(homeTeamName);
      leaderboardTeamsArray.push(homeTeam);
      teamNames.push(homeTeamName);
    }
    if (!teamNames.includes(awayTeamName)) {
      var awayTeam = new Team(awayTeamName);
      leaderboardTeamsArray.push(awayTeam);
      teamNames.push(awayTeamName);
    }
  }
}
getTeamNames(gameInfo);
// var teamindex = findTeam("Broncos", leaderboardTeamsArray);

function setTeamRecords(array) {
  var home_team_index;
  var away_team_index;

  function findTeam(team_to_find, team_array) {
    var index = 0;
    for (var i = 0; i < team_array.length; i++) {
      if (team_array[i].name == team_to_find) {
        index = i;
      }
    }
    return index;
  }

  for (var a = 0; a < array.length; a++) {
    // find home team index
    home_team_index = findTeam(array[a].home_team, leaderboardTeamsArray);
    // find away team index
    away_team_index = findTeam(array[a].away_team, leaderboardTeamsArray);

    // if home team wins..
    if (array[a].home_score > array[a].away_score) {
      // increment home team win
      leaderboardTeamsArray[home_team_index].wins += 1;
      // increment away team loss
      leaderboardTeamsArray[away_team_index].losses += 1;
    }
    // home team has lost
    else {
      // increment home team loss
      leaderboardTeamsArray[home_team_index].losses += 1;
      // increment away team win
      leaderboardTeamsArray[away_team_index].wins += 1;
    }
  }
}
setTeamRecords(gameInfo);

function sortTeams(array) {
  function compare(team1, team2) {
    var team1_stat = team1.wins - team1.losses;
    var team2_stat = team2.wins - team2.losses;

    if (team1_stat < team2_stat) {
      return 1;
    } else if (team1_stat > team2_stat) {
      return -1;
    } else {
      return 0;
    }
  }

  return array.sort(compare);
}
var sortedTeamsArray = sortTeams(leaderboardTeamsArray);

function setTeamRanks(array) {
  for (i = 0; i < array.length; i++) {
    array[i].rank = i + 1;
  }
  return array;
}
leaderboardTeamsArray = setTeamRanks(sortedTeamsArray);

function printer(array) {
  var output = "";
  output += "Teams\n";
  output += Array(52).join("-");
  output += "\n| Name       Rank     Total Wins     Total Losses |";
  for (i = 0; i < array.length; i++) {
    var team_name_length = leaderboardTeamsArray[i].name.length;
    var whitespace_amount_after_name = 11 - team_name_length;
    output += "\n| " + leaderboardTeamsArray[i].name + (Array(whitespace_amount_after_name + 1).join(" ")) + leaderboardTeamsArray[i].rank;
    output += "        " + leaderboardTeamsArray[i].wins + "              " + leaderboardTeamsArray[i].losses + "            |";
  }
  output += "\n";
  output += Array(52).join("-");
  console.log(output);
}
printer(leaderboardTeamsArray);

// Team.prototype.summary = function (array) {
//   var output = "";
//   var team_name = this.name;
//   output += "Name: " + team_name;
//   output += "\nRank: " + this.rank;
//   output += "\nWins: " + this.wins;
//   output += "\nLosses: " + this.losses;
//
//   (function getGameData(array) {
//     var game_data = "";
//     var game_counter = 1;
//     for (i = 0; i < array.length; i++) {
//       if ( (array[i].home_team == team_name) || (array[i].away_team == team_name) ) {
//         game_data += "\nGame " + game_counter + ": ";
//         game_data += "\nHome Team: " + array[i].home_team + " | Away Team: " + array[i].away_team;
//         game_data += "\nHome Score: " + array[i].home_score + " | Away Score: " + array[i].away_score;
//         game_counter += 1;
//       }
//     }
//     output += game_data;
//   }(array));
//
//   console.log(output);
// }

leaderboardTeamsArray[0].summary(gameInfo);
