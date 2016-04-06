require_relative 'pieces.rb'

class Board

  def initialize
    @grid = make_grid
    @sentinel = NullPiece.instance

  end

  def move(start, end_pos)


  end

  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Rook]

    i = (color == :white) ? 7 : 0

    pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i,j])
    end

  end

  def make_grid
    Array.new(8) { Array.new(8, sentinel)}
    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end

  end

  private

  attr_reader :sentinel
end
