class UsersController < ApplicationController
  before_action :authenticate_user_by_token, except: [:sign_in, :sign_up]
  
  def sign_in
    get_token
    @user = User.find_by_email(u_params[:email])
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
      @user = User.create(u_params)
      generate_token u_params[:email], u_params[:password]
      @user.update_attribute :access_token, @token

      if @user.save
        render json: @user, status: 201
      else
        render json: @user.errors, status: 422
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    generate_token u_params[:email], u_params[:password]
    @user.update_attribute :access_token, @token

    
    if @user.persisted?
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
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

  def profile
    hash = {
      id: @current_user.id,
      first_name: @current_user.first_name.humanize,
      last_name: @current_user.last_name.humanize,
      email: @current_user.email,
      access_token: @current_user.access_token,
      gender: @current_user.gender,
      country: @current_user.country.humanize,
      province: @current_user.province,
      age: @current_user.age,
      day_of_birth: @current_user.day_of_birth,
      total_pets: @current_user.pets.count
    }

    render json: hash, status: 200
  end

  private

  def user_exists?
    User.exists?(email: u_params[:email])
  end

  def u_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :country, :province, :password_digest)
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :country, :province, :gender, :password_digest)
  end

  protected
  
  def get_token
    @token ||= Authentication::Login.new(u_params[:email], u_params[:password]).execute
  end

  def generate_token email, password
    @token ||= Authentication::Login.new(email, password).generate_json_web_token
  end
end