class Goodreads
  attr_reader :isbn, :title, :image_url, :small_image_url, :link,
              :num_pages, :format, :publisher, :publication_year,
              :average_rating, :ratings_count, :description, :authors

  def initialize(attrs)
    @isbn = attrs["isbn"]
    @title = attrs["title"]
    @image_url = attrs["image_url"]
    @small_image_url = attrs["small_image_url"]
    @link = attrs["link"]
    @num_pages = attrs["num_pages"]
    @format = attrs["format"]
    @publisher = attrs["publisher"]
    @publication_year = attrs["publication_year"]
    @average_rating = attrs["average_rating"]
    @ratings_count = attrs["ratings_count"]
    @description = attrs["description"]
    @authors = attrs["authors"]
  end
end
