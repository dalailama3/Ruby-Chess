require 'singleton'

class Piece
  attr_reader :board, :color
  attr_accessor :position
  def initialize(color, board, position)
    @color, @board, @position = color, board, position

    board.add_piece(self, position)
  end

  def opposite_color
    if color == :white
      :black
    elsif color == :black
      :white
    end
  end

  def move_into_check?(move)
    board_copy = board.deep_dup
    board_copy.move(self.position, move)
    return true if board_copy.in_check?(self.color)
  end

  def valid_moves
    #look at current_moves
    #make a copy of current board reference
    #make move on board_copy
    #if king is in check after move is made, then move is invalid - reject it

    current_moves = self.moves
    valid_moves = current_moves.reject { |move| move_into_check?(move) }
    valid_moves
  end


end


class NullPiece
  include Singleton
  def symbol
    " "
  end

end
