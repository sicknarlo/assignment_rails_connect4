class ConnectFourController < ApplicationController

  def valid_move?(board, move)

    (0..6).include?(move) && board.game[move].include?(0)

  end


  def play
    # gamestate[:board => current game, :turn => 1 or 2]
    @gamestate = session[:gamestate]
    board = @gamestate["board"]
    p = @gamestate["turn"]

    @game = ConnectFour.new(board)
    @board = @game.board

    if @game.new_game
      @current_player = 1
    else
      @current_player =  p
    end

    @move = params[:radios]

    if valid_move?(@game.board, @move)
      @game.board.move(@move, @current_player)
      if @board.victory?
        flash.now[:success] = "Someone wins!"
        redirect_to gamecenter_path
      elsif @board.full?
        flash.now[:success] = "It's a tie!"
        redirect_to gamecenter_path
      else
        @current_player = 1 ? 2 : 1
        board = @game.board
        p = @current_player
        session[:gamestate] = [board, p]
        render :new
      end
    else
      flash.now[:error] = "Invalid move!"
      @gamestate["board"] = @game.board
      @gamestate["turn"] = @current_player
      session[:gamestate] = @gamestate
      render :new
    end

  end

end
