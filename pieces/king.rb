require_relative 'stepping_pieces'
class King < SteppingPiece
  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    symbol = (color == :white) ? ♔ : ♚
  end

  def move_dirs
    [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0],
      [1,1],
      [1,-1],
      [-1,-1],
      [-1,1]
    ]
  end



end
