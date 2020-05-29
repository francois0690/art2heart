class UsersController < ApplicationController

  def dashboard
    @transactions = current_user.transactions.all
    # @pieces = current_user.pieces
  end
end
