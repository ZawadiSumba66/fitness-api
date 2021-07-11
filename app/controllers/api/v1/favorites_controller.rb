class Api::V1::FavoritesController < ApiController
  def index
    favourites = current_user.favourited_houses
    render json: favourites, status: 200
  end
end
