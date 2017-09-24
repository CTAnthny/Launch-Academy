exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    return /\d/.test(str);
  },

  containsRepeatingLetter : function(str) {
    return /([A-Za-z])\1/.test(str);
  },

  endsWithVowel : function(str) {
    return /\b(\w+)[aeiouAEIOU]\b/.test(str);
  },

  captureThreeNumbers : function(str) {
    return /\d{3}/.test(str);
  },

  matchesPattern : function(str) {
    return /^(?:\(\d{3}\)|\d{3}-)\d{3}-\d{4}$/.test(str);
  },

  isUSD : function(str) {
    return /^\$\ ?[+-]?[0-9]{1,3}(?:,?[0-9])*(?:\.[0-9]{2})?$/.test(str);
  }
};
