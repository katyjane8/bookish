class User < ApplicationRecord
  has_many :favorites, dependent: :destroy

  def self.create_user(params)
    user = User.find_by(id: params[:id]) || User.new
    user.attributes = {
      id: params[:id],
      uid: params[:uid],
      name: params[:name],
      oauth_token: params[:oauth_token]
    }
    user.save!
    user
  end
end
