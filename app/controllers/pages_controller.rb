class PagesController < ApplicationController

  def home
    @pieces =  Piece.order('created_at DESC').limit(6)
  end
end
