require_relative 'piece.rb'
class SteppingPiece < Piece
  attr_reader :position, :board
  def initialize(color, board, position)
    super(color, board, position)
  end

  def moves
    moves = []
    result = []
    pos = position
    move_dirs.each do |dir|
      moves << [pos[0] + dir[0], pos[1] + dir[1]]
    end

    moves.reject { |move| own_piece_there?(move) || out_of_bounds(move) }
  end

  def own_piece_there?(pos)
    if !out_of_bounds(pos)
      return !board.empty?(pos) && board[pos].color == self.color
    end
  end


  def out_of_bounds(pos)
    pos.any? { |coord| coord < 0 || coord > 7 }
  end
end
