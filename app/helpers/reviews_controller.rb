class ReviewsController < ApplicationController

def index

@number = rand(100)

@reviews =  Review.all


end

def new
@review = Review.new


end

def create
@review = Review.new(params.require(:review).permit(:title, :body, :score))

@review.save

redirect_to root_path
end

end
