require_relative 'pieces.rb'
require 'byebug'

class Board
  attr_reader :grid
  def initialize(fill = true)
    make_grid(fill)
    @sentinel = NullPiece.instance

  end

  def move!(start, end_pos)
    start_piece = self[start]
    self[start] = nil
    add_piece(start_piece, end_pos)
  end

  def move(start, end_pos)
    #check if start pos if empty on Board
    raise "Select a piece!" if empty?(start)
    start_piece = self[start]

    if start_piece.moves.include? end_pos
      self[start] = nil
      add_piece(start_piece, end_pos)
      #update piece's position
      start_piece.position = end_pos
      if start_piece.class == Pawn
        start_piece.first_move = false
      end
    else
      raise "Illegal move"
    end
  end

  def empty?(pos)
    self[pos].nil?
  end

  def pieces
    grid.flatten.reject { |piece| piece == nil }
  end

  def deep_dup
    board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, board, piece.position)
    end
    return board
  end

  def in_check?(color)
    king_pos = find_king_pos(color)
    enemy_pieces = get_enemy_pieces(color)
    enemy_pieces.any? { |enemy| enemy.moves.include? king_pos }
  end

  def checkmate?(color)
    #if in_check?, check all your own pieces to see if they have any VALID moves"
    if in_check?
      own_pieces = get_own_pieces(color)
      return own_pieces.all? { |piece| piece.valid_moves == [] }
    end
    return false
  end

  def find_king_pos(color)
    grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        return [i,j] if self[[i,j]].class == King && self[[i,j]].color == color
      end
    end
  end

  def get_own_pieces(color)
    pieces = []
    grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        pieces << self[[i,j]] if !empty?([i,j]) && self[[i,j]].opposite_color != color
      end
    end
    pieces

  end

  def get_enemy_pieces(color)
    enemies = []
    grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        enemies << self[[i,j]] if !empty?([i,j]) && self[[i,j]].opposite_color == color
      end
    end
    enemies
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

  def in_bounds?(pos)
    pos.all? { |coord| coord >=0 && coord <= 7 }
  end


  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

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

  def make_grid(fill)
    @grid = Array.new(8) { Array.new(8, sentinel)}
    return unless fill
    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end

  end

  private

  attr_reader :sentinel
end
