class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @order
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :product_id, :address_id, :quantity, :status)
  end
end