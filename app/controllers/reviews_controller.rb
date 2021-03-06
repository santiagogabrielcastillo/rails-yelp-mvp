class ReviewsController < ApplicationController

  # GET /restaurants/restaurant_id/reviews/new
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # POST /restaurants/restaurant_id/reviews
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
