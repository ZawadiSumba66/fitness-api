class JsonWebToken
    def self.encode(payload)
      JWT.encode payload.merge(exp: expiration), Rails.application.credentials.fetch(:secret_key_base)
    end
  def self.decode(token)
      JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
    end
  end