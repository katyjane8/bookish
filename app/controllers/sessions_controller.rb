class SessionsController < ApplicationController
  def new
    consumer = OAuth::Consumer.new(ENV["GOODREADS_CLIENT_ID"],
                               ENV["GOODREADS_SECRET"],
                               :site => 'https://www.goodreads.com')
    request_token = consumer.get_request_token
    redirect_to request_token.authorize_url
  end


  def create
    access_token = request_token.get_access_token

  #   client_id     = ENV["GOODREADS_CLIENT_ID"]
  #   client_secret = ENV["GOODREADS_SECRET"]
  #   code          = params[:code]
  #   response      = Faraday.post("https://www.goodreads.com/api/auth_user?key=#{client_id}&secret=#{client_secret}")
  #   pairs = response.body.split("&")
  #   response_hash = {}
  #   pairs.each do |pair|
  #     key, value = pair.split("=")
  #     response_hash[key] = value
  # end
  #
  # token = response_hash["token"]
  #
  # oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
  #
  # auth = JSON.parse(oauth_response.body)
  #
  # user          = User.find_or_create_by(uid: auth["id"])
  # user.username = auth["login"]
  # user.uid      = auth["id"]
  # user.token    = token
  # user.save
  #
  # session[:user_id] = user.id

  redirect_to dashboard_path
  # user = User.update_or_create(request.env["omniauth.auth"])
  #     session[:id] = user.id
  #     redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
