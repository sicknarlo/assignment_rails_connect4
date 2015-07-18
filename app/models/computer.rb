require_relative "player"

class Computer < Player 

#   def deep_dupe(arr)

#     new_arr = []

#     arr.each do |x|
#       new_arr << x.dup
#     end

#     new_arr

# end



#   def check_for_win(board)

#     temp = []

#      7.times do |i|
#       temp = board
#       temp.game = deep_dupe(board.game)

#       temp.move(i, 1)
#         if temp.victory?
#           puts "winning move is"
#           p i
#         end

#     end





   # return nil
#   end

  def get_move(board)

    #check_for_win(board)

    until valid_move?(board, move = (0..6).to_a.sample)
    end
    return move

  end

end