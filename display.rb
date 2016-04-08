require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :board
  attr_accessor :cursor, :selected, :previous_selection

  def initialize(board)
    @board = board
    @cursor = [6,4]
    @previous_selection = nil
    @selected = nil
    render_board
    start_cursor

  end

  def start_cursor
    while true
      get_input
      render_board
    end
  end

  def render_board
    system("clear")
    result = ""
    (0..board.grid.length-1).each do |i|
      row_str = ""
      (0..(board.grid[i].length-1)).each do |j|

        if board.empty?([i, j])
          if [i,j] == @cursor
            row_str += "   ".on_yellow
          elsif [i,j] == @previous_selection || [i,j] == @selected
            row_str += "   ".on_light_red
          else
            row_str += ((i + j) % 2 == 0) ? "   ".on_light_green : "   ".on_cyan
          end
        else
          if [i,j] == @cursor
            row_str += board[[i,j]].symbol.on_yellow
          elsif [i,j] == @previous_selection || [i,j] == @selected
            row_str += board[[i,j]].symbol.on_light_red
          else
            row_str += ((i + j) % 2 == 0) ? board[[i,j]].symbol.on_light_green : board[[i,j]].symbol.on_cyan
          end
        end
      end
      row_str += "\n"
      result += row_str
    end

    puts result
  end

  def padded(str)
    return " #{str} "
  end
end
