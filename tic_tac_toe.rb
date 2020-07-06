require_relative "game"
require_relative "game_logic"

# Initalizes game and asks for player names
puts "Welcome to Tic-Tac-Toe"
puts "What is Player 1's name?"
player_1 = gets.chomp
puts "What is player 2's name?"
player_2 = gets.chomp

running_game = Game.new(player_1, player_2)
running_game.run