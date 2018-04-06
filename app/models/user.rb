class User < ApplicationRecord
  def initialize(token)
    @token = token
  end
  # def self.update_or_create(auth)
  #   user = User.find_by(id: auth[:id]) || User.new
  # #   user.attributes = {
  # #   provider: auth[:provider],
  # #   uid: auth[:uid],
  # #   email: auth[:info][:email],
  # #   first_name: auth[:info][:first_name],
  # #   last_name: auth[:info][:last_name],
  # #   token: auth[:credentials][:token],
  # #   refresh_token: auth[:credentials][:refresh_token],
  # #   oauth_expires_at: auth[:credentials][:expires_at]
  # # }
  #   user.save!
  #   user
  # end
end
