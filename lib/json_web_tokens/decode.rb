module JsonWebTokens

  class Decode
    attr_reader :token, :payload

    def initialize(token)
      @token = token
    end

    def execute
      return false unless decoded_json_token
      payload
    end

    private

    def decoded_json_token
      @payload ||= JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
			
    	rescue JWT::DecodeError, JWT::VerificationError => e
      Rails.logger.info("Not a valid token #{e.message}")

      nil
    end

  end
end