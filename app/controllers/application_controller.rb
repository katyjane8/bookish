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

  def token_generator
    hash = { oauth_token: session["token"], oauth_token_secret: session["token_secret"]}
    request_token = OAuth::RequestToken.from_hash(consumer, hash)
    access_token = request_token.get_access_token
    response = access_token.get('/review/list.xml').body.force_encoding 'UTF-8'
    raw_data = Hash.from_xml(response)
    @book_info = raw_data["GoodreadsResponse"]["books"]["book"].map do |result|
      Book.new(result)
    end
   @book_info
  end
end
