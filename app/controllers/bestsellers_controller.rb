class BestsellersController < ApplicationController
  def index
    response = Faraday.get("http://api.nytimes.com/svc/books/v2/lists.json?api-key=#{ENV["NYT_KEY"]}&list=mass-market-paperback")
    raw_data = JSON.parse(response.body, symbolize_headers: true)
    @nyt_reviews = raw_data["results"].map do |result|
      Reviews.new(result)
    end

    hardcover = Faraday.get("http://api.nytimes.com/svc/books/v2/lists.json?api-key=#{ENV["NYT_KEY"]}&list=hardcover-fiction")
    raw_data = JSON.parse(hardcover.body, symbolize_headers: true)
    @nyt_hc_reviews = raw_data["results"].map do |result|
      Reviews.new(result)
    end
  end
end
