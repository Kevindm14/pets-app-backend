class UsersController < ApplicationController
  attr_reader :current_user
  before_action :authenticate_user_by_token, except: [:sign_in, :sign_up]
  
  def sign_in
    get_token
    @user = User.find_by_email(user_params[:email])
    if @token
      render json: @user, status: 200
    else
      render json: { status: 401, errors: [ { details: 'Invalid user' } ] }, status: 401
    end
  end

  def sign_up
    if user_exists?
      render json: { status: 401, errors: [ { details: 'Email already taken' } ] }, status: 401
    else
      @user = User.create(user_params)
      generate_token user_params[:email], user_params[:password]
      @user.access_token = @token
      if @user.save
        render json: @user, status: 201
      else
        render json: @user.errors, status: 422
      end
    end
  end

  def sign_out
    generate_token @current_user.email, @current_user.password

    @user = User.find_by_email(@current_user.email)
    @user.access_token = @token
    
    if @user.save
      render json: {message: "Sign out successfully"}, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

  protected

  def authenticate_user_by_token
    @current_user ||= Authentication::TokenValidator.new(
      request.headers["Authorization"]
    ).execute
    unless current_user && (request.headers["Authorization"] == @current_user.access_token)
      render json: { status: 401, errors: [ { detail: 'Access Denied.'}] }, status: 401
    end
  end

  def get_token
    @token ||= Authentication::Login.new(u_params[:email], u_params[:password]).execute
  end
  
  def generate_token email, password
    @token ||= Authentication::Login.new(email, password).generate_json_web_token
  end  

  private

  def user_exists?
    User.exists?(email: user_params[:email])
  end

  def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_digest)
  end
end