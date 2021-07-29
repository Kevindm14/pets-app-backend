require 'json_web_tokens/encode'

module Authentication
  class Login
    attr_reader :email, :password

    def initialize(email, password)
      @email = email
      @password = password
    end

    def execute
      return false unless valid_user?
      @user.access_token
    end

    def generate_json_web_token
      return false unless user
      JsonWebTokens::Encode.new(user_params).execute
    end

    private

    def user
      @user ||= User.find_by_email(email)
    end

    def valid_user?
      return false unless user
      @user.authenticate(password)
    end

    def user_params
      {
        user_id: user.id,
        first_name: user.first_name,
        email: user.email
      }
    end
  end
end