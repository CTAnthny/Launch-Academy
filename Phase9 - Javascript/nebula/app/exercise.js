exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {
  indexOf : function(arr, item) {
    return arr.indexOf(item);
  },

  sum : function(arr) {
    var total = 0;
    for (let num of arr)
    total += num;
    return total;
  },

  remove : function(arr, item) {
    function notEqual(value) {
      return value != item;
    }
    var filtered = arr.filter(notEqual);
    return filtered;
  },

  reverseString : function(str) {
    var new_str = '';
    for (var i = str.length - 1; i >= 0; i--)
      new_str += str[i];
    return new_str;
  },

  longestSubString : function(str) {
    var str_array = str.split(' ');
    var greatest_word_length = 0;
    var longest_word;
    for (let word of str_array) {
      if (word.length > greatest_word_length)
        longest_word = word;
        greatest_word_length = word.length;
    }
    return longest_word;
  },

  letterMoveForward : function(str) {
    return str.replace(/[a-zA-Z]/g, function(letter) {
      var letter_char_code = letter.charCodeAt(0);
      switch(letter_char_code) {
        case 90: return 'A';
        case 122: return 'a';
        default: return String.fromCharCode(letter_char_code + 1);
      }
    });
    // for (let letter of str) {
    //   if (typeof letter === 'string') {
    //     var letter_index = str.indexOf(letter);
    //     var letter_char_code = str.charCodeAt(letter_index);
    //     switch(letter_char_code) {
    //       case 90:
    //         str.replace(letter, 'A');
    //         break;
    //       case 122:
    //         str.replace(letter, 'a');
    //         break;
    //       default:
    //         var next_letter = String.fromCharCode((letter_char_code++));
    //         str.replace(letter, next_letter);
    //         break;
    //     }
    //   }
    // }
    // return str;
  },

  capitalizeWords : function(str) {
    var str_array = str.split(' ');
    var new_str_array = [];
    for (let word of str_array) {
      var first_letter = word.match(/\w/);
      var replaced_word = word.replace( first_letter[0], (first_letter[0].toUpperCase()) );
      new_str_array.push(replaced_word);
    }
    return new_str_array.join(' ');
  }
};
