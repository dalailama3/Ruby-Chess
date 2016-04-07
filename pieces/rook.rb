require_relative 'sliding_pieces.rb'
class Rook < SlidingPiece
  def initialize(color, board, position)
    super(color, board, position)
  end

  def symbol
    symbol = (color == :white) ? " ♖ " : " ♜ "
  end

  def move_dirs
    [
      [0,1],
      [0,-1],
      [-1,0],
      [1,0]
    ]

  end
end
