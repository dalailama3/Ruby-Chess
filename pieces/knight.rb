require_relative 'stepping_pieces'
class Knight < SteppingPiece
  def initialize(color, board, position)
    super(color, board, position)
  end

  def move_dirs
    [
      [1,2],
      [1,-2],
      [-1,2],
      [-1,-2],
      [2,1],
      [2,-1],
      [-2,-1],
      [-2,1]
    ]
  end



end
