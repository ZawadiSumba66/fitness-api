class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!

  def create
    user = User.create(user_params)

    if user.save
      render json: { token: JsonWebToken.encode(sub: user.id) }, status: 200
    else
      render json: { message: user.errors.full_messages }, status: 400
    end
  end

  def show
    user = User.find(params[:id])
    favorites = user.favorited_tips
    response = { user: user, favorites: favorites }
    render json: response
  end

  def edit
    User.find_by(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { user: user }, status: 200
    else
      render json: { message: 'User was not updated!' }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
