# Core class for running Tic-Tac-Toe
# Prompts the players for their names
# Runs the game by creating an instance of game.rb (Game.new) and calling its run method
# Author: Shane Gilbert
require_relative "game"

# Initalizes game and asks for player names
puts "Welcome to Tic-Tac-Toe"
puts "What is Player 1's name?"
player_1 = gets.chomp
puts "What is player 2's name?"
player_2 = gets.chomp

running_game = Game.new(player_1, player_2)
running_game.run