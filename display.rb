require 'colorize'

class Display
  include Cursorable
  attr_reader :board
  attr_accessor :cursor
  def initialize(board)
    @board = board
    @cursor = [6,4]
    @selected = false
    startCursor
  end

  def startCursor

  end

  def render
    result = ""
    (0..board.grid.length-1).each do |i|
      row_str = ""
      (0..(board.grid[i].length-1)).each do |j|
        if board.empty?([i, j])
          if [i,j] == cursor
            row_str += "  ".on_yellow
          else
            row_str += ((i + j) % 2 == 0) ? "  ".on_green : "  ".on_blue
          end

        else
          if [i,j] == cursor
            row_str += padded(board[[i,j]].symbol).on_yellow
          else
            row_str += ((i + j) % 2 == 0) ? padded(board[[i,j]].symbol).on_green : padded(board[[i,j]].symbol).on_blue
          end
        end


      end
      row_str += "\n"
      result += row_str
    end
    puts result
  end

  def padded(str)
    return str.center(2)
  end
end
