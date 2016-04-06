require_relative 'piece.rb'
class SlidingPiece < Piece
  attr_reader :dir
  def initialize(color, board, position, dir)
    super(color, board, position)
    @dir = dir
  end
  def move_dirs

    if dir == "all"
      move_dirs = [
        [0,1],
        [0,-1],
        [1,0],
        [-1,0],
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
      ]
    elsif dir == "horiz"
      move_dirs = [
        [0,1],
        [0,-1]
      ]
    elsif dir == "vert"
      move_dirs = [
        [1,0],
        [-1,0]
      ]
    elsif dir == "diag"
      move_dirs = [
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
      ]
    end
    move_dirs
  end


end
