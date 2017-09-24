class MinimumCI
  def compute(array)
    sorted_array = array.sort
    low = sorted_array[0]
    high = sorted_array[-1]
    consecutives = *(low..high)
    original_length = array.length
    consecutives_length = consecutives.length
    return consecutives_length - original_length
  end
end
