
def solve(n)
  empty_board = Array.new(n){Array.new(n)}
  boards = [empty_board]
  #puts boards.inspect
  recursive_solve(boards, n, 0)

end

def add_to_new_board(board, position)
  new_board = board.map(&:dup)
  # board.count.times do |row|
#     board.count.times do |col|
#       unless new_board[row][col] == :q
#         if row == position[0] || col == position[1] ||
#           (row - position[0]).abs == (col - position[1]).abs
#           new_board[row][col] = :x
#         end
#       end

      # end
  #   end

  fill_column(new_board,position)
  fill_row(new_board,position)
  fill_diags(new_board,position)
  new_board[position[0]][position[1]] = :q

  new_board
end

def fill_column(board, position)
  column = position[1]
  board.each do |row|
    unless row[column] == :q
      row[column] = :x
    end
  end
end

def fill_row(board, position)
  row = position[0]
  board.count.times do |column|
    unless board[row][column] == :q
      board[row][column] = :x
    end
  end
end

def fill_diags(board, position)
  board.count.times do |row|
    board.count.times do |col|
      unless board[row][col] == :q
        if (row - position[0]).abs == (col - position[1]).abs
          board[row][col] = :x
        end
      end
    end
  end
end

def recursive_solve(boards,n, i)
  #puts "recursion #{boards.size}, #{i}"
  #puts display(boards.last)
  if boards.size == n+1
    puts 'win'
    puts display(boards.last)
    return 'win'
  end

  new_boards = boards.dup
  current_row = boards.size-1
  boards.last.each do |row|
    row.each_index do |i|
      if boards.last[current_row][i].nil?
        new_boards << add_to_new_board(boards.last, [current_row,i])
        recursive_solve(new_boards,n, i)
        #puts "finished #{boards.size}, #{i}"
        new_boards.pop
      end
    end
    #puts "next i is #{i}"
  end


end

def display(board)
  #puts board.inspect
  board.map do|row|
    puts row.inspect
    row.map do|sq|
      sq == :q ? 'Q' : '-'
    end.join
  end
end

solve(8)

