require_relative 'piece.rb'
class SlidingPiece < Piece
  attr_reader :position
  def initialize(color, board, position)
    super(color, board, position)
  end

  def moves
    pos = position
    moves = []
    move_dirs.each do |dir|
      new_pos = [(pos[0] + dir[0]), (pos[1] + dir[1])]
      until out_of_bounds(new_pos)
        moves << new_pos
        new_pos = [(new_pos[0] + dir[0]), new_pos[1] + dir[1]]
      end
    end
    moves

  end

  def out_of_bounds(pos)
    pos.any? { |coord| coord < 0 || coord > 7 }
  end
end
