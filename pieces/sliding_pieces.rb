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
      until out_of_bounds(new_pos) || piece_in_way(new_pos)
        moves << new_pos
        new_pos = [(new_pos[0] + dir[0]), new_pos[1] + dir[1]]
      end
      #want to include the pos in which the impeding piece is of opposite_color to our piece
      if board[new_pos] != NullPiece.instance && board[new_pos].opposite_color == self.color
        moves << new_pos
      end
    end
    moves
  end

  def out_of_bounds(pos)
    pos.any? { |coord| coord < 0 || coord > 7 }
  end

  def piece_in_way(pos)
    board[pos] != NullPiece.instance

  end

end
