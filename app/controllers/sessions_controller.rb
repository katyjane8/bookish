class SessionsController < ApplicationController
  def new
    redirect_to goodreads_token.authorize_url
  end

  def create
    # client_id     = ENV["GOODREADS_CLIENT_ID"]
    # client_secret = ENV["GOODREADS_SECRET"]
    # token          = params[:oauth_token]
    # goodreads_client = User.new(token)
    # goodreads_client.save!
    
    redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
