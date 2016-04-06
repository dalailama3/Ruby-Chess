require_relative 'pieces.rb'

class Board
  def initialize
    @grid = make_grid
    @sentinel = NullPiece.instance

  end

  def move(start, end_pos)


  end

  def make_grid
    Array.new(8) { Array.new(8, "foo")}

  end
end
