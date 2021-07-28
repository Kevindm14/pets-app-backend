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
      generate_json_web_token
    end

    private

    def user
      user ||= User.where(email: @email).first
    end

    def valid_user?
      return false unless user
      user.authenticate(password)
    end

    def generate_json_web_token
      JsonWebTokens::Encode.new(user_params).execute if user
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