# Handles the logic of Tic-Tac-Toe
# initialize: Creates a board instance variable
# update(piece, position): Updates the board with new pieces (x/o)
# display: displays the baord in a 3x3 grid
# take_turn(player): Prompts the player for their move. Checks for valid inputs and returns the position
# Author: Shane Gilbert

class GameLogic
  attr_reader :position, :board

  #Initializes an empty board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  #Updates the new 'piece' in the 'position' of the array. Returns false if position already taken
  def update(piece, position)
    #Corrects for zero-based array
    position = position - 1
    if @board[position / 3][position % 3] == position + 1
      #Updates the array for the new 'piece'
      @board[position / 3][position % 3] = piece
      return true
    else return false
    end
  end

  #Checks for three in a row (Winning game). Can probably be done in a better way
  def check(position)
    puts position
    case position
    when 1
      if @board[0][0] == @board[0][1] and @board[0][0] == @board[0][2]
        return true
      elsif @board[0][0] == @board[1][0] and @board[0][0] == @board[2][0]
        return true
      elsif @board[0][0] == @board[1][1] and @board[0][0] == @board[2][2]
        return true
      else return false
      end
    when 2
      if @board[0][1] == @board[0][0] and @board[0][1] == @board[0][2]
        return true
      elsif @board[0][1] == @board[1][1] and @board[0][1] == @board[2][1]
        return true
      else return false
      end
    when 3
      if @board[0][2] == @board[0][1] and @board[0][2] == @board[0][0]
        return true
      elsif @board[0][2] == @board[1][2] and @board[0][2] == @board[2][2]
        return true
      elsif @board[0][2] == @board[1][1] and @board[0][2] == @board[2][0]
        return true
      else return false
      end
    when 4
      if @board[1][0] == @board[0][0] and @board[1][0] == @board[2][0]
        return true
      elsif @board[1][0] == @board[1][1] and @board[1][0] == @board[1][2]
        return true
      else return false
      end
    when 5
      if @board[1][1] == @board[0][0] and @board[1][1] == @board[2][2]
        return true
      elsif @board[1][1] == @board[1][0] and @board[1][1] == @board[1][2]
        return true
      elsif @board[1][1] == @board[0][1] and @board[1][1] == @board[2][1]
        return true
      elsif @board[1][1] == @board[0][2] and @board[1][1] == @board[2][0]
        return true
      else return false
      end
    when 6
      if @board[1][2] == @board[0][2] and @board[1][2] == @board[2][2]
        return true
      elsif @board[1][2] == @board[1][0] and @board[1][2] == @board[1][1]
        return true
      else return false
      end
    when 7
      if @board[2][0] == @board[0][0] and @board[2][0] == @board[1][0]
        return true
      elsif @board[2][0] == @board[1][1] and @board[2][0] == @board[0][2]
        return true
      elsif @board[2][0] == @board[2][1] and @board[2][0] == @board[2][2]
        return true
      else return false
      end
    when 8
      if @board[2][1] == @board[2][0] and @board[2][1] == @board[2][2]
        return true
      elsif @board[2][1] == @board[0][1] and @board[2][1] == @board[1][1]
        return true
      else return false
      end
    when 9
      if @board[2][2] == @board[2][0] and @board[2][2] == @board[2][1]
        return true
      elsif @board[2][2] == @board[0][0] and @board[2][2] == @board[1][1]
        return true
      elsif @board[2][2] == @board[0][2] and @board[2][2] == @board[1][2]
        return true
      else return false
      end
    else
      puts "Error: Switch has a bug"
    end
  end

  #displays the board as a 3x3 grid
  def display
    @board.each { |x| 
      puts x.join(" ")
    }
  end

  # Players takes their turn. Checks for invalid responses. Returns the chosen position
  def take_turn player
    puts "#{player}, It is your turn. What position on the board would you like to mark?"
    int_input = false
    @position = gets.to_i
    while int_input == false do
      if check_integer == false
        puts "Input was invalid. Please try again"
        @position = gets.to_i
      elsif check_input_range == false 
        puts "Position doesn't exist on the board. Please try again"
        @position = gets.to_i
      else int_input = true
      end
    end
    return @position
  end
  
  private

  # Checks if the input is an integer
  def check_integer
    if @position == 0 
      return false
    else return true
    end
  end

  # Checks if the input is within the range of options on the board (1-9)
  def check_input_range
    if @position > 9 || @position < 1
      return false
    else return true
    end
  end
end