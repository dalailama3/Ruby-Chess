require_relative 'stepping_pieces'

class Pawn < SteppingPiece
  def initialize(color, board, position)
    super(color, board, position)
    @first_move = true
  end

  #override moves method
  def moves
    pos = position
    moves = []
    steps = (color == :white) ? -1 : 1
    moves << [pos[0] + steps, pos[1]]
    if @first_move
      moves << [pos[0] + steps * 2, pos[1]]
    end

    moves

  end
end