require 'json_web_tokens/decode'

module Authentication
  class TokenValidator
    attr_reader :token, :user

    def initialize(token)
      @token = token
    end

    def execute
      return false unless decoded_token
      # return false if expired_token?
      find_and_return_user
    end

    private

    # def expired_token?
    #   decoded_token['expiration'] < 24.hours.ago.to_i
    # end

    def find_and_return_user
      @user ||= User.find(decoded_token['user_id'])
    end

    def decoded_token
      @decoded_token ||= JsonWebTokens::Decode.new(token).execute
    end
  end
end