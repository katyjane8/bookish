class Book
  # belongs_to :user

  attr_reader :isbn, :title, :image_url, :small_image_url, :large_image_url, :link,
              :num_pages, :format, :publisher, :publication_year,
              :average_rating, :ratings_count, :description, :authors
  def initialize(attrs)
    @isbn = attrs["book"]["isbn"]
    @title = attrs["book"]["title"]
    @image_url = attrs["book"]["image_url"]
    @small_image_url = attrs["book"]["small_image_url"]
    @large_image_url = attrs["book"]["large_image_url"]
    @link = attrs["book"]["link"]
    @num_pages = attrs["book"]["num_pages"]
    @format = attrs["book"]["format"]
    @publisher = attrs["book"]["publisher"]
    @publication_year = attrs["book"]["publication_year"]
    @average_rating = attrs["book"]["average_rating"]
    @ratings_count = attrs["book"]["ratings_count"]
    @description = attrs["book"]["description"]
    @authors = attrs["book"]["authors"]
  end
end
