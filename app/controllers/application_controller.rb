class ApplicationController < ActionController::API
	attr_reader :current_user

	private

	def authenticate_user_by_token
		puts request.headers["Authorization"]
		@current_user ||= Authentication::TokenValidator.new(request.headers["Authorization"]).execute
		unless current_user && (request.headers["Authorization"] == @current_user.access_token)
			render json: { status: 401, errors: [ { detail: 'Access Denied.'}] }, status: 401
		end
	end
end
