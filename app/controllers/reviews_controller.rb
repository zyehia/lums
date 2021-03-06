class ReviewsController < ApplicationController
  load_and_authorize_resource
  def new
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.course = @course
    @review.user = current_user
    @review.rating = 0 if @review.rating.nil?
    if @review.save
      redirect_to courses_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :course_id)
  end
end
