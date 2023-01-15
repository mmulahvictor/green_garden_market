class Api::V1::PaymentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:show, :update, :destroy]

  def index
    @payments = Payment.all
    render json: @payments
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @payment
  end

  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:order_id, :card_number, :card_holder, :expiration_month, :expiration_year, :security_code)
  end
end