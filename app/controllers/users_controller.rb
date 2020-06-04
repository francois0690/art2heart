class UsersController < ApplicationController

  def dashboard
    @transactions = current_user.transactions.all
    @total = 0
    current_user.transactions.all.each do |t|
       @total += (t.date_end - t.date_start).to_i * t.piece.price
       p @total
    end

    @pieces =  Piece.order('created_at DESC').limit(6)
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
