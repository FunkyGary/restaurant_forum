class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @restaurant = Restaurant.find(params[:id])
    @commet = Commet.new
  end

end
