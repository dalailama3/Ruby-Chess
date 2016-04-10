require_relative 'board'
require_relative 'display'
require_relative 'player'
class Game
    attr_reader :board, :display, :players
    attr_accessor :current_player
    def initialize
      @board = Board.new
      @display = Display.new(@board)
      @players = {
        white: HumanPlayer.new(:white, @display),
        black: HumanPlayer.new(:black, @display)
      }
      @current_player = :white
    end

    def game_over?
      board.checkmate?(current_player)
    end

    def play
      until game_over?
        begin
          start, end_pos = players[@current_player].play_turn
          board.move(start, end_pos)

          swap_turn

        rescue StandardError => e
          display.messages[:error] = e.message
          retry
        end
      end
      display.render
    end

    def swap_turn
      @current_player = (@current_player == :white) ? :black : :white
    end



end
