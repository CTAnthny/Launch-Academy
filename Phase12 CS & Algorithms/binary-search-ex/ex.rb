require 'pry'
def binary_search(list_to_search, value_to_find)
  low, high = 0, list_to_search.length
  middle = (low + high) / 2

  while (low <= high)
    middle = (low + high) / 2

    return list_to_search[middle] if list_to_search[middle] == value_to_find
    binding.pry
    if list_to_search[middle] < value_to_find
      low = middle + 1 # search lower half
    else
      high = middle - 1 # search upper half
    end
  end

  nil # return nil if value wasn't found in list
end
array = %w(names, to, find, in, list)
binary_search(array, "list")
