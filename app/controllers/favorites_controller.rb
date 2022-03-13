class FavoritesController < ApplicationController

  def create
    target = Target.find(params[:target_id])
    @favorite = current_user.favorites.new(target_id: target.id)
    @favorite.save
    redirect_to request.referer
  end

  def destroy
     target = Target.find(params[:target_id])
    @favorite = current_user.favorites.find_by(target_id: target.id)
    @favorite.destroy
    redirect_to request.referer
  end
end
