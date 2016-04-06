require_relative 'sliding_pieces.rb'
class Queen < SlidingPiece
  def initialize(color, board, position)
    super(color, board, position)
  end

  def move_dirs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
      [0,1],
      [0,-1],
      [-1,0],
      [1,0]
    ]

  end
end
