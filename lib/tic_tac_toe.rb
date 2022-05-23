def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    (input.to_i)-1
end
  
def move(array, index, value)
    array[index] = value
  puts array
end

def valid_move?(board, index)
    if index <= 8 && index >= 0 && position_taken?(board, index) == false
        return true
    else 
        return false
    end
end

def position_taken?(board, index)
    if board[index] == "X" || board[index] == "O"
        return true
    else 
        false
    end 
end 

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index) == true
        move(board, index, current_player(board))
    elsif valid_move?(board, index) == false
        until valid_move?(board, index) == true
         puts "Please enter 1-9:"
         input = gets.strip
         index = input_to_index(input)
         valid_move?(board, index)
        end
        move(board, index, current_player(board))
    end
    display_board(board)
end

def turn_count(board)
    counter = 0
    board.each do |element|
        if element == "X" or element == "O"
            counter += 1
        end
    end
counter
end

def current_player(board)
    if turn_count(board) % 2 == 0
        "X"
    else 
        "O"
    end 
end 

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def won?(board)
  won = false 
  WIN_COMBINATIONS.each do |win| 
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" and position_2 == "X" and position_3 == "X")
      won = true
      return win
    elsif (position_1 == "O" and position_2 == "O" and position_3 == "O")
      won = true 
      return win
    end
  end 
  won
end 

def full?(board)
  all_full = true 
  board.each do |index|
    if index == " " || index == ""
      all_full = false
    end 
  end 
  all_full
end 

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else 
    return false
  end 
end 

def over?(board)
  if won?(board) != false
    return true 
  elsif draw?(board) == true 
    return true 
  elsif full?(board) ==true 
    return true 
  else 
    false
  end 
end 

def winner(board)
  if  won?(board) == false  
    return nil
  elsif board[(won?(board))[0]] == "X"
    return "X"
  elsif board[(won?(board)[0])] == "O"
    return "O"
  end 
end 

def play(board)
    while over?(board) == false
        turn(board)
    end 
    if draw?(board) == true 
        puts "Cat's Game!"
    elsif draw?(board) == false  
        puts "Congratulations #{winner(board)}!" 
    end 
end 
