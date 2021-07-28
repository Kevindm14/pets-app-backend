class UsersController < ApplicationController
  before_action :authenticate_user_by_token, except: [:sign_in]
  skip_before_action :authenticate_user_by_token, only: [:sign_up]

  def sign_in
    set_token
    @user = User.where(user: user_params[:email]).or(User.where(email: user_params[:email])).first
    if @token
      @user.update_columns access_token: @token
      render json: set_response(200), status: 200
    else
      render json: { status: 401, message: 'Access Denied' }, status: 401
    end
  end

  def sign_up
    set_token
    @user = User.new(user_params)

    if @user.save
      @user.update_columns access_token: @token
      render json: set_response(201), status: 201
    else
      render json: { status: 401, message: 'Account not created' }, status: 401
    end
  end

  private
  def set_response(status)
    response = {
      status: status,
      message: {
        user: {
          id: @user.id,
          first_name: @user.first_name,
          last_name: @user.last_name,
          email: @user.email,
          access_token: @user.access_token
        }
      }
    }
  end
end