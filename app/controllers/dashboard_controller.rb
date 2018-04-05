class DashboardController < ApplicationController
  def index
    response = Faraday.get(URI.parse("https://www.goodreads.com/review/list/2518130.xml?key=#{ENV["GOODREADS_CLIENT_ID"]}&v=2")).body.force_encoding 'UTF-8'
    raw_data = Hash.from_xml(response)
    @book_info = raw_data["GoodreadsResponse"]["reviews"]["review"].map do |result|
      BookQueue.new(result["book"])
    end
  end
end
