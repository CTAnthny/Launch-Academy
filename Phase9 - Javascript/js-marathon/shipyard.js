// YOUR CODE GOES HERE
// function launchpad(ship_name) {
//   console.log("Iniation of pre-flight procedures - go!");
//   console.log("Ship " + ship_name + " has arrived!");
// }
// launchpad();

function Ship(name, crew) {
  this.name = name;
  this.crew = [];
  this.propulsion = null;
  this.mountPropulsion = function(object) {
    this.propulsion = object;
    console.log("Propulsion " + object.type + " mounted!")
  }
  return this;
}
var ourShip = new Ship("Nebuchadnezzar");
// launchpad(ourShip.name);

var crewNames = ["Chris", "Christina", "Angela", "Nick", "Dominic", "Derrick", "Darlene", "Joshua"];
function CrewMember(name) {
  this.name = name;
  this.trained = false;
  return this;
}

var crewMembers = [];
function trainCrew(crew_array) {
  for (i = 0; i < crew_array.length; i++) {
    var trainee = new CrewMember(crew_array[i]);
    trainee.trained = true;
    crewMembers.push(trainee);
  }
}
trainCrew(crewNames);
// console.log(crewMembers);

Ship.prototype = {
  constructor: Ship,
  captain: function () {
    var crew_amount = crewMembers.length;
    var random_number = Math.floor(Math.random() * crew_amount);
    this.captain = crewMembers[random_number].name;
  },
  loadCrew: function(crew_array) {
    for (i = 0; i < crew_array.length; i++) {
      this.crew.push(crew_array[i]);
      var crew_member_name = crew_array[i].name;
      console.log(crew_member_name + " has joined the ship!");
    }
  },
  takeoff: function() {
    if (this.propulsion.fire() == true) {
      console.log("SPFFFFFFFFFFFHHHHHHHHHH!!!");
    }
    else {
      console.log("Takeoff was unsuccessful!");
    }
  }
}

var rocket = {
  type: "rocket",
  fuel: 0,
  addfuel: function(amount) {
    this.fuel += amount;
    console.log(this.fuel);
  },
  fire: function() {
    if (rocket.fuel > 0) {
      rocket.fuel -= 1;
      console.log("The rocket engines have been fired with " + rocket.fuel + " fuel remaining!");
      return true;
    }
    else {
      console.log("There is not enough fuel and the engines failed to fire!");
      return false;
    }
  }
}

var ship_names = ["St. Maria", "Nina", "Pinta"];
var fleet = {
  name: "Avast",
  ships: [],
  build: function(ship_names_array) {
    for (i = 0; i < ship_names_array.length; i++) {
      var new_ship = new Ship(ship_names_array[i], crewMembers);
      this.ships.push(new_ship);
      console.log("Welcome to the fleet " + new_ship.name + "!");
    }
  }
}
fleet.build(ship_names);
//
// function launchpad(ship_name, crew_array) {
//   console.log("Iniation of pre-flight procedures - go!");
//   console.log("Ship " + ship_name + " has arrived!");
//   ourShip.loadCrew(crew_array);
//   ourShip.captain();
//   console.log("This mission's captain is " + ourShip.captain + "!");
//   rocket.addfuel(10);
//   ourShip.mountPropulsion(rocket);
//   ourShip.takeoff();
// }
// launchpad(ourShip.name, crewMembers);
