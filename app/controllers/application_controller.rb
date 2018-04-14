class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  helper_method :current_user, :goodreads_token, :token_generator

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def consumer
    OAuth::Consumer.new(ENV["GOODREADS_CLIENT_ID"],ENV["GOODREADS_SECRET"],
    :site => 'https://www.goodreads.com')
  end

  def goodreads_token
    request_token = consumer.get_request_token
    session["token"] = request_token.token
    session["token_secret"] = request_token.secret
    return request_token
  end

  def get_user_info
    hash = { oauth_token: session["token"], oauth_token_secret: session["token_secret"]}
    request_token = OAuth::RequestToken.from_hash(consumer, hash)
    access_token = request_token.get_access_token
    user_data = access_token.get('/api/auth_user.xml').body.force_encoding 'UTF-8'
    raw_user_data = Hash.from_xml(user_data)
    update_info(raw_user_data["GoodreadsResponse"]["user"])
  end

  def update_info(info)
    if current_user.uid == nil
      current_user.update(uid: info["id"], name: info["name"])
    else
    end 
  end
end
