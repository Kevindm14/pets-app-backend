module JsonWebTokens

  class Encode
    attr_accessor :payload
    attr_reader :expiration, :token

    # def initialize(payload, expiration = 1.year.from_now.to_i)
    def initialize(payload)
      @payload = payload
      # payload[:exp] = expiration
      payload[:iat] = Time.now.to_i
    end

    def execute
      generate_json_token
    end

    private
		
    def generate_json_token
      @token ||= JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end
    # def add_expiration_to_payload
    #   payload[:expiration] = expiration.to_i
    # end
  end
end