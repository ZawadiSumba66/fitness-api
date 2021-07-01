class API::V1::FavoritesController < ApiController
    favourites = current_user.favourited_houses
    render json: favourites, status: 200
end