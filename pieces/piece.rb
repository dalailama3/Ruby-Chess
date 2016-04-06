require 'singleton'

class Piece
  attr_reader :board, :position, :color
  def initialize(color, board, position)
    @color, @board, @position = color, board, position

    # board.add_piece(self, position)
  end


end





class NullPiece
  include Singleton


end
