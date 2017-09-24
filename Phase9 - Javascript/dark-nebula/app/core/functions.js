exports = (typeof window === 'undefined') ? global : window;

exports.functionsAnswers = {
  isPrime : function(num) {
    var divisor = num - 1;
    while (divisor > 1) {
      if ((num % divisor) == 0) return false;
      divisor--;
    }
    return true;
  },

  arraySum : function(array) {
    var total = array.reduce(function(a, b) {
      return a + b;
    }, 0);
    return total;
  },

  fizzBuzz : function(num) {
    if ( Number.isInteger(num) ) {
      var output = "";
      if (num % 3 == 0) {
        output += "fizz";
      }
      if (num % 5 == 0) {
        output += "buzz";
      }
      return output || num;
    }
    else {
      return false;
    }
    // write a function that receives a number as its argument;
    // if the number is divisible by 3, the function should return 'fizz';
    // if the number is divisible by 5, the function should return 'buzz';
    // if the number is divisible by 3 and 5, the function should return
    // 'fizzbuzz';
    //
    // otherwise the function should return the number, or false if no number
    // was provided or the value provided is not a number
  }
};
