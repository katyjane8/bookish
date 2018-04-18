class BestsellerService
  def initialize
  end

  def conn
    # Faraday.new("http://api.nytimes.com") do |f|
    #   f.request  :url_encoded
    #   f.headers["api-key"] = ENV["NYT_KEY"]
    # end
  end

  def paperback
    response = Faraday.get("http://api.nytimes.com/svc/books/v2/lists.json?api-key=#{ENV["NYT_KEY"]}&list=mass-market-paperback")
    raw_data = JSON.parse(response.body, symbolize_headers: true)
    raw_data["results"].map do |result|
      Review.new(result)
    end
  end

  def hardcover
    response = Faraday.get("http://api.nytimes.com/svc/books/v2/lists.json?api-key=#{ENV["NYT_KEY"]}&list=hardcover-fiction")
    raw_data = JSON.parse(response.body, symbolize_headers: true)
    raw_data["results"].map do |result|
      Review.new(result)
    end
  end

    private

    def parse_json(response)
      JSON.parse(response.body, symbolize_headers: true)
    end
end
