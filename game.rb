# TODO: UPDATE - Check for previously selected option

require_relative "game_logic"

class Game

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def run
    game = GameLogic.new
    game.display
    game_repeat = true
    # while game_repeat == true do
      position = game.take_turn(@player_1)
      game.update("x", position) # TODO: Check for previously selected option
      game.display
      position = game.take_turn(@player_2)
      game.update("o", position)
      game.display
    # end
  end
end