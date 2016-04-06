require_relative 'pieces.rb'

class Board

  def initialize
    @grid = make_grid
    @sentinel = NullPiece.instance

  end

  def move(start, end_pos)
    #check if start pos if empty on Board

    #ok, if there is a piece on start pos, then check to see if there is a piece on end_pos

    #if no piece => move it there if piece's moves includes start pos
    # else check to see if piece on end_pos if of opposite color and is in piece's moves


  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def [](pos)
    i,j = pos
    @grid[i][j]
  end

  def []=(pos, piece)
    i, j = pos
    @grid[i][j] = piece
  end

  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Rook]

    i = (color == :white) ? 7 : 0

    pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i,j])
    end

  end

  def fill_pawn_row(color)
    i = (color == :white) ? 6 : 1

    (0..7).each do |j|
      Pawn.new(color, self, [i, j])
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
