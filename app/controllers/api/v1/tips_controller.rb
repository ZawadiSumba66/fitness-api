class API::V1::TipsController < ApiController
   def index
    tips = Tip.all
    render json: tips, status: 200
   end 
   def create
      tip = current_user.tips.create(tip_params)
      if tip.save!
        render json: {tip: tip}, status: 200
      else
        render json: {:message => tip.errors.full_messages}, status: 400
    end
   end
   def show
    tip = Tip.find(params[:id])
    if tip
        render json: {tip: tip}, status: 200
        render json: {:message => 'No tip found'}, status: 400
    end
   end
   def favorite 
    if current_user.favorites.exists?(tip_id: params[:tip_id])
    render json: {:message => 'Tip has already been added to favorites'}, status: forbidden
    else
       tip = Tip.find_by(params[:house_id])
       current_user.favorited_tips << tip
       render json: {:message => 'Tip successfully added to favorites'}
    end
   end

   def unfavourite
     favorite = current_user.favorites.find_by(tip_id: params[:tip_id])
     favorite.delete
     render json: { :message =>'Successfuly removed' }
   end
    
   def tip_params
    params.require(:tip).permit(:name, :description, :benefits, :image, :instructions)
   end
end