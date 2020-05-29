class TransactionsController < ApplicationController
  def create
  end

  def destroy
  end

  def edit
  end

  def index
    @transactions = current_user.transactions.all
    @total = 0
    current_user.transactions.all.each do |t|
       @total += t.piece.price
       p @total
    end
  end

  def new
    @piece = Piece.find(params[:piece_id])
  end

  def show
  end

  def update
  end
end
