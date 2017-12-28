class ReviewsController < ApplicationController
  before_action :check_login, except: %i[index show]

  def index
    @price = params[:price]
    @cuisine = params[:cuisine]
    @cuisine = params[:location]

    @reviews = Review.all

    @reviews = @reviews.where(price: @price) if @price.present?

    @reviews = @reviews.where(cuisine: @cuisine) if @cuisine.present?

    @reviews = @reviews.near(@location) if @location.present?
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)

    @review.user = @current_user

    if @review.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy if @review.user == @current_user

    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != @current_user
      redirect_to root_path
    elsif @review.created_at < 1.hour.ago
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to root_path
    else
      if @review.update(form_params)
        redirect_to review_path(@review)
      else
        render 'edit'
      end
    end
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :body,
                                   :telefone, :ambiance, :score, :cuisine, :price, :address, :photo)
  end
end
