class Reviews
  attr_reader :list_name, :bestsellers_date, :published_date, :rank, :weeks_on_list,
              :title, :description, :author, :isbns
  def initialize(attrs)
    @list_name = attrs["list_name"]
    @bestsellers_date = attrs["bestsellers_date"]
    @published_date = attrs["published_date"]
    @rank = attrs["rank"]
    @weeks_on_list = attrs["weeks_on_list"]
    @isbns = attrs["isbns"][0]["isbn13"]
    @title = attrs["book_details"][0]["title"]
    @description = attrs["book_details"][0]["description"]
    @author = attrs["book_details"][0]["author"]
  end
end
