class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:id])
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to restaurant_path(@review.restaurant_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
