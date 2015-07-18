require_relative "player"


class Human < Player


  def get_move(board)

    puts "Enter next move"
    #
    loop do
      until valid_move?(board, move = gets.chomp.to_i - 1)
        puts "Invalid move"
      end
      return move

      # if (0..6).include?(move)
      #   return move
      # else
      #   puts "Invalid move"
      # end
    end

  end

end
