exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {
    for (i = 0; i < arr.length; i++) {
      if (arr[i] == item) {
          arr.splice(i, 1);
          i -= 1;
      }
    }
    return arr;
  },

  append : function(arr, item) {
    arr.push(item);
    return arr;
  },

  truncate : function(arr) {
    arr.pop();
    return arr;
  },

  prepend : function(arr, item) {
    arr.unshift(item);
    return arr;
  },

  curtail : function(arr) {
    arr.shift();
    return arr;
  },

  concat : function(arr1, arr2) {
    return arr1.concat(arr2);
  },

  insert : function(arr, item, index) {
    arr.splice(index, 0, item);
    return arr;
  },

  count : function(arr, item) {
    var item_count = 0;
    for (i = 0; i < arr.length; i++) {
      if (arr[i] == item)
        item_count += 1;
    }
    return item_count;
  },

  duplicates : function(arr) {
    var uniques_array = [];
    var duplicates_list_array = [];
    for (i = 0; i < arr.length; i++) {
      if ( uniques_array.includes(arr[i]) ) {
        if ( !duplicates_list_array.includes(arr[i]) ) {
          duplicates_list_array.push(arr[i]);
        }
      }
      else {
        uniques_array.push(arr[i]);
      }
    }
    return duplicates_list_array;
  },

    // var temp_array = [];
    // var duplicates_array = for (i = 0; i < arr.length; i++) {
    //   // chops non-duplicates from arr
    //   if ( !temp_array.includes(arr[i]) )
    //     temp_array.push(arr[i]);
    //     arr.splice(i, 1);
    //     i -= 1;
    // }
    //
    // var filtered_duplicates = duplicates_array.filter(function(elem, pos, array) {
    //   return array.indexOf(elem) == pos;
    // });
    //
    // return filtered_duplicates;


  square : function(arr) {
    var squared = arr.map(function(num) {
      return num * num;
    });
    return squared;
  },

  findAllOccurrences : function(arr, target) {
    var matches_index_array = [];
    for (i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        matches_index_array.push(i);
      }
    }
    return matches_index_array;
  }
};
