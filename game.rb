# Handles running the game using GameLogic methods
# Author: Shane Gilbert
require_relative "game_logic"

class Game
  # Initializes the players into an array instance variable '@players'
  def initialize(player_1, player_2)
    @players = []
    @players.push(player_1)
    @players.push(player_2)
  end

  # Uses methods from GameLogic to run the game
  def run
    run_again = true
    while run_again == true
      game = GameLogic.new
      move_count = 0              # Tracks number of completed moves
      game.display
      game_repeat = true
      while game_repeat == true do
        for i in 0..1 
          # Checks for repeat position
          repeat_position = false
          until repeat_position do
            position = game.take_turn(@players[i])
            if i == 0
              repeat_position = game.update("X", position)
            elsif i == 1
              repeat_position = game.update("O", position)
            end
            if repeat_position == false 
              puts "That position was already selected. Choose another position"
            else 
              move_count += 1
            end
          end
          game.display
          # Checks for tie
          if move_count == 9
            game_repeat = false
            puts "Game is a tie!"
            break
          end
          # Checks for 3 in a row
          if game.check(position) == true
            game_repeat = false
            puts "#{@players[i]} is the winner!"
            break
          end
        end
      end
      # Prompts the user to play again
      puts "Would you like to play again? (y/n)"
      incorrect_response = true
      # Checks for valid responses
      while incorrect_response do 
        input_repeat = gets.chomp.downcase
        if input_repeat == 'y'
          incorrect_response = false
        elsif input_repeat == 'n'
          incorrect_response = false
          run_again = false
        else 
          puts "Please enter 'y' or 'n'"
        end
      end
    end
  end
end