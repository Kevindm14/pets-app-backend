class ApplicationController < ActionController::API
	protected

  attr_reader :current_user

  def authenticate_user_by_token
		@current_user ||= Authentication::TokenValidator.new(request.headers["Authorization"]).execute

		unless current_user && (request.headers["Authorization"] == @current_user.access_token)
			render json: { status: 401, message: 'Access Denied' }, status: 401
		end
  end

  def set_token
		@token ||= Authentication::Login.new(user_params[:email], user_params[:password]).execute
  end

  private

  def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_digest)
  end
end
