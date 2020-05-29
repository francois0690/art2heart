class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def create
    @transaction = Transaction.new(transaction_params)
    @piece = Piece.find(params[:piece_id])
    @transaction.piece = @piece
    @transaction.user = current_user
    @transaction.save
    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
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
    @transaction = Transaction.new
    @piece = Piece.find(params[:piece_id])
  end

  def show
  end

  def update
    @transaction.update(transaction_params)
    redirect_to transaction_path(@transaction)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:start, :end, :piece_id)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

end
