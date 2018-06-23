class CommetsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @commet = @restaurant.commets.build(commet_params)
    @commet.user = current_user
    @commet.save!
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @commet = Commet.find(params[:id])

    if current_user.admin?
      @commet.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def commet_params
    params.require(:commet).permit(:content)
  end
end
