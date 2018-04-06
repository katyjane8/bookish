class DashboardController < ApplicationController
  def index
    @book_info = token_generator

    response = Faraday.get("http://api.nytimes.com/svc/books/v2/lists.json?api-key=#{ENV["NYT_KEY"]}&list=mass-market-paperback")
    raw_data = JSON.parse(response.body, symbolize_headers: true)
    @nyt_reviews = raw_data["results"].map do |result|
      Reviews.new(result)
    end
  end 
end
