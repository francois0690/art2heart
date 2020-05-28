class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      redirect_to piece_path(@piece)
    else
      render :new
    end
  end

  def destroy
    @piece.destroy
    redirect_to pieces_path
  end

  def edit
    @piece.update(piece_params)
    redirect_to piece_path(@piece)
  end

  def index
    @pieces = Piece.all
  end

  def new
    @piece = Piece.new
    @user = curent_user
  end

  def show
  end

  def update
  end

  private

  def set_piece
    @piece = Pieces.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:photo)
  end
end
