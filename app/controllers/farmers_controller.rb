class Api::V1::FarmersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farmer, only: [:show, :update, :destroy]

  def index
    @farmers = Farmer.all
    render json: @farmers
  end

  def create
    @farmer = Farmer.new(farmer_params)

    if @farmer.save
      render json: @farmer, status: :created
    else
      render json: @farmer.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @farmer
  end

  def update
    if @farmer.update(farmer_params)
      render json: @farmer
    else
      render json: @farmer.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @farmer.destroy
  end

  private

  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

  def farmer_params
    params.require(:farmer).permit(:name, :email, :password, :password_confirmation)
  end
end