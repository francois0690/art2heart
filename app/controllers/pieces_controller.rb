class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  def create
    @piece = Piece.new(piece_params)
    @piece.owner = current_user
    @piece.save
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
  end

  def index
    @pieces = Piece.all
  end

  def new
    @piece = Piece.new
    @user = current_user
  end

  def show
    set_piece
    # https://fr.wikipedia.org/w/api.php?action=query&format=json&uselang=user&prop=extracts&list=&titles="#{@piece.name}"&exsentences=3&exintro=1&explaintext=1
  end

  def update
    @piece.update(piece_params)
    redirect_to piece_path(@piece)
  end

  def my_pieces
    @pieces = current_user.pieces
    render :index
  end

  private

  def set_piece
    @piece = Piece.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:name, :artist, :category, :price, photos: [])
  end
end
