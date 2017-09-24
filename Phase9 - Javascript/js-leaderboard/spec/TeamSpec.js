// YOUR CODE HERE
// describe("Team", function() {
//   describe("new Circle()", function() {
//     it("takes a value for the radius", function() {
//       circle = new Circle(5);
//       expect(circle).toBeDefined();
//       expect(circle.radius).toEqual(5);
//     });
//   });
describe("Team", function() {
  var testTeam;

  beforeEach(function() {
    testTeam = new Team("Panthers", 5, 1, 4);
  });

  describe("new Team()", function () {
    it("takes a value for name", function () {
      expect(testTeam).toBeDefined();
      expect(testTeam.name).toBe("Panthers");
    });
  });

    it("takes a value for rank", function() {
      expect(testTeam.rank).toBe(5);
    });

    it("takes a value for wins", function() {
      expect(testTeam.wins).toBe(1);
    });

    it("takes a value for losses", function() {
      expect(testTeam.losses).toBe(4);
    });

  describe("#summary", function() {
    var testGameInfo;

    it("returns a summary of the team", function() {
      // set up a team, call summary on it and expect it to be a certain string
      testGameInfo = [
         {
           home_team: "Panthers",
           away_team: "Broncos",
           home_score: 17,
           away_score: 30
         },
         {
           home_team: "Buccaneers",
           away_team: "Panthers",
           home_score: 23,
           away_score: 12
         }
       ];

      expect(testTeam.summary(testGameInfo)).toContain("Game 1");
      expect(testTeam.summary(testGameInfo)).toContain("Game 2");
      expect(testTeam.summary(testGameInfo)).toContain("Score");
      expect(testTeam.summary(testGameInfo)).toContain("Panthers");
    });
  });
});
