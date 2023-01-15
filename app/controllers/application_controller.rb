class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from StandardError, with: :handle_error

  private

  def handle_error(error)
    case error
    when ActiveRecord::RecordNotFound
      render json: { message: 'Record not found' }, status: :not_found
    when ActiveRecord::RecordInvalid
      render json: { message: error.record.errors }, status: :unprocessable_entity
    else
      render json: { message: 'An unexpected error occurred' }, status: :internal_server_error
    end
  end
end
