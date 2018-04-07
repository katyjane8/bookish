class SessionsController < ApplicationController
  def new
    redirect_to goodreads_token.authorize_url
  end

  def create
    user = User.update_or_create(params)
      session[:id] = user.id

    redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
