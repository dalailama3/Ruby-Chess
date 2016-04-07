require_relative 'sliding_pieces.rb'
class Bishop < SlidingPiece
  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    symbol = (color == :white) ? " ♗ " : " ♝ "
  end

  def move_dirs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ]

  end
end
