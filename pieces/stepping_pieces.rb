require_relative 'piece.rb'
class SteppingPiece < Piece
  attr_reader :position
  def initialize(color, board, position)
    super(color, board, position)
  end

  def moves
    moves = []
    pos = position
    move_dirs.each do |dir|
      moves << [pos[0] + dir[0], pos[1] + dir[1]]
    end
    moves.reject { |move| is_own_piece(move) }
  end

  def is_own_piece(pos)
    board[pos] != NullPiece.instant && board[pos].color == self.color
  end
end
