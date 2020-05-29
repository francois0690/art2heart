class UsersController < ApplicationController

  def dashboard
    @transactions = current_user.transactions.all
    @total = 0
    current_user.transactions.all.each do |t|
       @total += t.piece.price
       p @total
    end

    @pieces = Piece.all
    # @pieces = current_user.pieces
  end
end
