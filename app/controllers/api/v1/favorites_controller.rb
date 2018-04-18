class Api::V1::FavoritesController < ActionController::API

  def index
    favorites = Favorite.all
    render json: favorites
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: favorite
    else
      render json: favorite.errors, status: 400
    end
  end

    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :title, :description, :author, :isbns)
    end
end
