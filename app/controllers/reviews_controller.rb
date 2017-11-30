class ReviewsController < ApplicationController

  def index
    @number = rand(100)
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)
    @review.save
    redirect_to root_path
  end

  def show  
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review = update(form_params)
    redirect_to review_path(@review)
  end

  def form_params
    params.require(:review).permit(:title, :body, :score)
  end

end
