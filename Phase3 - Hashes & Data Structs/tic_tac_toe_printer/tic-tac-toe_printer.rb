def print_grid(board)
  board.each_with_index do |row, index|
    board_array = []
    row.each do |spot|
      if spot.nil?
        board_array << "   "
      else
        board_array << " #{spot} "
      end
    end
    puts board_array.join("|")
    if index < board.size - 1
      ( (row.count * 3) + 2).times { print "-" }
    end
    puts
  end
end

board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil]
]

print_grid(board_a)
