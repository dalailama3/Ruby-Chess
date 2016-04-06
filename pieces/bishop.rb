require_relative 'sliding_pieces.rb'
class Bishop < SlidingPiece
  def initialize(color, board, position, dir)
    super(color, board, position, dir)
  end


  def moves
    dir

  end


end
