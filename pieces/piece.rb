require 'singleton'

class Piece
  attr_accessor :board, :position, :color
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


end


class NullPiece
  include Singleton


end
