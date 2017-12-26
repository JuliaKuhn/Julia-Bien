class ReviewsController < ApplicationController

  before_action :check_login, except: [:index, :show]

  def index
@price = params[:price]
@cuisine = params[:cuisine]
@cuisine = params[:location]


@reviews = Review.all
if @price.present?
  @reviews = @reviews.where(price: @price)
end

if @cuisine.present?
  @reviews = @reviews.where(cuisine: @cuisine)
end




if @location.present?
  @reviews = @reviews.near(@location)
end

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
  render "new"
end

  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == @current_user
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != @current_user
      redirect_to root_path
  end

  def update
    @review = Review.find(params[:id])

        if @review.user != @current_user
          redirect_to root_path
        else

          if @review.update(form_params)
              redirect_to review_path(@review)
            else
          render "edit"
            end
        end



  def form_params
    params.require(:review).permit(:title, :restaurant, :body,
      :telefone, :ambiance, :score, :cuisine, :price, :address)
end

end
