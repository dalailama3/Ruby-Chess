require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :board, :game, :messages
  attr_accessor :cursor, :first_selection, :second_selection

  def initialize(board)
    @board = board
    @cursor = [6,4]
    @first_selection = nil
    @second_selection = nil
    @messages = {}
  end

  def reset
    # first_selection = nil
    # second_selection = nil
    @messages.delete(:error)
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
          elsif [i,j] == @first_selection || [i,j] == @second_selection
            row_str += "   ".on_light_red
          else
            row_str += ((i + j) % 2 == 0) ? "   ".on_light_green : "   ".on_cyan
          end
        else
          if [i,j] == @cursor
            row_str += board[[i,j]].symbol.on_yellow
          elsif [i,j] == @first_selection || [i,j] == @second_selection
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
    @messages.each do |k, v|
      puts "#{v}"
    end
  end

  def padded(str)
    return " #{str} "
  end
end
