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

# describe Generator do
#   context "creating" do
#     context "when a seed is specified" do
#       it "uses that seed" do
#         seed = 123
#         generator = Generator.new(seed)
#         generator.seed.should == seed
#       end
#     end
#     context "when a seed is not specified" do
#       it "creates its own seed" do
#         generator = Generator.new
#         generator.seed.should_not be_nil
#       end
#     end
#   end
# end
