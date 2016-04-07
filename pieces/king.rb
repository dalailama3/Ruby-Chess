require_relative 'piece'
class King < SteppingPiece
  def initialize(color, board, position)
    super(color, board, position)
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
