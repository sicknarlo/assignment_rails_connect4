class Board

  attr_accessor :game

  def initialize(board)

    if board.nil?
      @game = Array.new(7) { Array.new(6) { 0 }  }
    else
      @game = board
    end

  end


  def render

    system "clear"

    display = @game.transpose
    display.each {|i| p i }
    puts "---------------------"
    7.times { |i| print "-"; print (i + 1 ); print ("-")}
    puts
    
    puts

  end


  def move(col,player_number)

    row = @game[col].detect {|i| i != 0}
    if row.nil?
      @game[col][-1] = player_number
    else
      @game[col][@game[col].index(row) - 1] = player_number

    end

  end

  def full?

    @game.each do |i| 
      return false if i.include?(0) 

    end

    return true

  end

  def victory?

    vert_victory? || horz_victory? || diag_victory?
    
  end

  private

  def horz_victory?

    @game.each do |row|

      3.times do |i|

        test_array = [row[i],row[i+1],row[i+2],row[i+3]]

        return true if is_winner?(test_array)

      end

    end

  return false

  end

  def is_winner?(array)
    array[0] == array[1] &&
    array[1] == array[2] &&
    array[2] == array[3] &&
    array[0] != 0
  end

  def vert_victory?

    @game.transpose.each do |row|

      4.times do |i|
        test_array = [row[i],row[i+1],row[i+2],row[i+3]]
        return true if is_winner?(test_array)
      end
    end

    return false

  end

  def diag_standard_victory?

    4.times do |vert|
      3.times do |horz|

        test_array = [game[vert][horz], @game[vert + 1][horz + 1], @game[vert + 2][horz + 2], @game[vert + 3][horz + 3]]
        return true if is_winner?(test_array)
      end

    end

    return false

  end

  def diag_reverse_victory?

    4.times do |vert|
      3.times do |horz|

        test_array = [@game.reverse[vert  ][horz  ], game.reverse[vert   + 1][horz   + 1], @game.reverse[vert  + 2][horz  + 2], @game.reverse[vert   + 3][horz   + 3]]
        return true if is_winner?(test_array)
      end

    end

    return false

  end


  def diag_victory?

    diag_standard_victory? || diag_reverse_victory?

  end  

end
