
class Game
    def initialize(board, player1, player2)
      @board = board,
      @player1 = player1,
      @player2 = player2
    end

    def game_over?
      return board.checkmate?(:white) || board.checkmate(:black)
    end

    def play
      until game_over?
        
    end



end
