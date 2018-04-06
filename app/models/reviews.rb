class Reviews
  attr_reader :list_name, :bestsellers_date, :published_date, :rank, :weeks_on_list,
              :isbns, :book_details
  def initialize(attrs)
    @list_name = attrs["list_name"]
    @bestsellers_date = attrs["bestsellers_date"]
    @published_date = attrs["published_date"]
    @rank = attrs["rank"]
    @weeks_on_list = attrs["weeks_on_list"]
    @isbns = attrs["isbns"]
    @book_details = attrs["book_details"]
  end
end
