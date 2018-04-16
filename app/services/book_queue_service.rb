class BookQueueService
  attr_reader :uid

  def initialize(current_user)
    @real_id = current_user.uid.to_i
  end

  def conn
    Faraday.new(url: "https://www.goodreads.com") do |faraday|
    faraday.adapter Faraday.default_adapter
    # faraday.params = ENV["GOODREADS_CLIENT_ID"]
    end
  end

  def get_book_queue
    response = conn.get("https://www.goodreads.com/review/list/#{@real_id}.xml?key=#{ENV["GOODREADS_CLIENT_ID"]}&v=2").body.force_encoding 'UTF-8'
    raw_data = Hash.from_xml(response)
    @book_service = raw_data["GoodreadsResponse"]["reviews"]["review"].map do |result|
      Book.new(result)
    end
    @book_service
  end

  def get_book_info
    get_book_queue.map do |new_id|
      new_id.isbn
    end
  end
end
