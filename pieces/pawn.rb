require_relative 'stepping_pieces'

class Pawn < SteppingPiece
  attr_accessor :first_move
  def initialize(color, board, position)
    super(color, board, position)
    @first_move = true
  end

  def symbol
    symbol = (color == :white) ? " ♙ " : " ♟ "
  end

  #override moves method
  def moves
    pos = position
    moves = []
    steps = (color == :white) ? -1 : 1
    moves << [pos[0] + steps, pos[1]]
    if @first_move
      moves << [pos[0] + steps * 2, pos[1]] if board.empty?([pos[0] + steps * 2, pos[1]])
    end

    taking_squares = [[pos[0] + steps, pos[1] + 1], [pos[0] + steps, pos[1] - 1]]
    taking_squares.each do |square|
      if !board.empty?(square) && board[square].color != self.color
        moves << square
      end
    end

    moves

  end
end
