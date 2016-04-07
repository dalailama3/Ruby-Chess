require 'colorize'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor = nil
    @selected = false
  end

  def render
    result = ""
    (0..board.grid.length-1).each do |i|
      row_str = ""
      (0..(board.grid[i].length-1)).each do |j|
        if board.empty?([i, j])
          row_str += ((i + j) % 2 == 0) ? "  ".on_green : "  ".on_blue
        else
          row_str += ((i + j) % 2 == 0) ? board[[i,j]].symbol.on_green : board.grid[[i,j]].symbol.on_blue
        end
      end
      row_str += "\n"
      result += row_str
    end
    puts result
  end




end
