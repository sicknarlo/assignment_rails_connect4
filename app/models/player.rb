class Player

  attr_reader :num

  def initialize(player_number)
    @num = player_number
  end

  def valid_move?(board, move)

    (0..6).include?(move) && board.game[move].include?(0)

  end


end