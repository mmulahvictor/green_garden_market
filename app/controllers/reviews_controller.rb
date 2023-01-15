class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :update, :destroy]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @review
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render
      json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :product_id, :rating, :description)
  end
end