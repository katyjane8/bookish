class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  def index
    @favorites = current_user.favorites
  end

  def destroy
    @favorite.destroy
    redirect_to favorites_path
  end

    private

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end
end
