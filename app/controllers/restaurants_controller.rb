class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :dashboard]
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @commet = Commet.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_commets = Commet.order(created_at: :desc).limit(10)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
