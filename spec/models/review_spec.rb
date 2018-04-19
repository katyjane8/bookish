require 'rails_helper'

RSpec.describe Review, type: :model do
  context "creating" do
    context "when attrs are specified" do
      it "uses attrs" do
        attrs = {
          "list_name" => "oiewur",
          "bestsellers_date" => "something",
          "published_date" => "1092123",
          "rank" => "something",
          "weeks_on_list" => "something",
          "book_details" => [{"title" => "something"}],
          "description" => "something",
          "author" => "something",
          "isbns" => "something"
        }
        review = Review.new(attrs)

        expect(review.list_name).to eq("oiewur")
        expect(review.published_date).to eq("1092123")
        expect(review.title).to eq("something")
      end
    end
  end
end
