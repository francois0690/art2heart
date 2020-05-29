class TransactionsController < ApplicationController
  def create
  end

  def destroy
  end

  def edit
  end

  def index
    @transactions = Transaction.all
  end

  def new
    @piece = Piece.find(params[:piece_id])
  end

  def show
  end

  def update
  end
end
