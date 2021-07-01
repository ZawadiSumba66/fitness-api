class API::V1::UsersController < ApiController
  def create
    if params[:email].nil?
        render json: {:message => 'User request must contain the user email.'}, status: 400
        return
    elsif params[:password].nil?
    render json: {:message => 'User request must contain the user password.'}, status: 400
      return
    end

    if params[:email]
        duplicate_user = User.find_by_email(params[:email])
        unless duplicate_user.nil?
          render json: {:message => 'Duplicate email. A user already exists with that email address.'}, status: 409
          return
        end
    end
    @user = User.create(user_params)
    if @user.save!
        render json: { token: JsonWebToken.encode(sub: user.id)}, status: 200
      else
        render json: {:message => @user.errors.full_messages}, status: 400
    end
  end


  def show 
    @user = User.find_by(params[:id])
    render json: 
  end
end