class ReviewsController < ApplicationController
  def new
    # BOTH for the form
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # post '/restaurants/22/reviews' (no view)
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
