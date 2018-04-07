class User < ApplicationRecord
  def self.update_or_create(params)
    user = User.new || User.find_by(id: params[:id])
    user.attributes = {
      id: params["id"],
      oauth_token: params["oauth_token"]
    }
    user.save!
    user
  end
end
