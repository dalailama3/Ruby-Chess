require_relative 'piece.rb'
class SlidingPiece < Piece

  def initialize(color, board, position)
    super(color, board, position)
  end

  def moves
    move_dirs.each do |dir|
      p dir
    end

  end





end
