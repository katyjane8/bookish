class BookController < ApplicationController
  before_action :set_book

  def index
    response = Faraday.get("https://www.goodreads.com/book/title.xml?key=#{ENV["GOODREADS_CLIENT_ID"]}&title=#{@book.last.title}").body.force_encoding 'UTF-8'
    raw_data = Hash.from_xml(response)
    @book_show = BookInfo.new(raw_data["GoodreadsResponse"]["book"])
  end

    private

    def set_book
      @book = Book.all
    end
end
