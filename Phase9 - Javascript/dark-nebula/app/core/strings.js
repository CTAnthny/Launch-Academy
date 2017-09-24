exports = (typeof window === 'undefined') ? global : window;

exports.stringsAnswers = {
  reduceString: function(str, amount) {
    var stringArray = str.split('');
    var modifiedArray = [];
    var duplicate_counter = 0;
    var prev_char = '';
    for (i = 0; i < stringArray.length; i++) {
      if (stringArray[i] == prev_char) {
        if (duplicate_counter < amount) {
            modifiedArray.push(stringArray[i]);
            duplicate_counter += 1;
        }
      }
      else {
        modifiedArray.push(stringArray[i]);
        duplicate_counter = 1;
        prev_char = stringArray[i];
      }
    }
    return modifiedArray.join('');
  },

  reverseString: function(str) {
    var reverseString = str.split('').reverse().join('');
    return reverseString;
  }
};
