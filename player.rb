
class HumanPlayer
  attr_reader :color, :display
  def initialize(color, display)
    @color = color
    @display = display
  end

  def play_turn
    start = nil
    end_pos = nil
    until start && end_pos
      display.render_board

      if start
        puts "#{color}'s turn.  Move to where?"
        end_pos = display.get_input
        # display.second_selection = end_pos
        # display.render_board

        display.reset if end_pos
      else
        puts "#{color}'s turn.  Move from where?"
        start = display.get_input
        # display.first_selection = start

        display.reset if start
      end
    end
    [start, end_pos]

  end


end
