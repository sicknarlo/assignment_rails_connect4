=begin

Initialize game [ConnectFour]
Create empty board [Board]
Create Player [Player]

loop until game conditions met
	Render board [Board]
	Get player move [Player]
	Add move to board [Board]
	Check game end conditions [Board]

=end

require_relative "board"
require_relative "computer"
require_relative "human"
require_relative "player"


class ConnectFour

  attr_reader :board, :new_game

  def initialize(gamestate)
    # Gamestate[:board => current_board]
    # @player1 = Human.new(1)
    # @player2 = Human.new(2)

    @board = Board.new(gamestate)

    if gamestate.nil?
      @new_game = true
    else
      @new_game = false
    end

  end


  # def play

  #   @current_player = @player1

  #   loop do
  #     @board.render
  #     print_instructions
  #     puts "Player #{@current_player.num} turn"
  #     @board.move(@current_player.get_move(@board), @current_player.num)
  #     if @board.victory?
  #       @board.render
  #       puts "Player #{@current_player.num} Wins!"
  #       break
  #     elsif @board.full?
  #       @board.render
  #       puts "It's a tie!"
  #       break
  #     end
  #     switch_player
  #   end

  # end

  # def switch_player
    
  #   if @current_player == @player1
  #     @current_player = @player2
  #   else
  #     @current_player = @player1
  #   end

  # end

  def print_instructions

    puts "*****Enter the column where you want to drop your piece*****"

  end

end


# c4 = ConnectFour.new

# c4.play