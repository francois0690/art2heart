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

  def profil
  end

  def update_avatar
  current_user.update(profil_params)
  redirect_to profil_path
  end

  private
  def profil_params
    params.require(:user).permit(:avatar)
  end
end
