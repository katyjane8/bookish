require "spec_helper"
require "./app/models/book"

describe Book do
  let(:attrs) {
    {
      "isbn"=>"1501156209",
      "title"=>"The Lying Game",
      "image_url"=>"https://images.gr-assets.com/books/1520163193m/36622726.jpg",
      "small_image_url"=>"https://images.gr-assets.com/books/1520163193s/36622726.jpg",
      "link"=>"https://www.goodreads.com/book/show/36622726-the-lying-game",
      "num_pages"=>"416",
      "format"=>"Paperback",
      "publisher"=>"Gallery/Scout Press",
      "publication_year"=>"2018",
      "average_rating"=>"3.53",
      "ratings_count"=>"33253",
      "description"=>"On a cool June morning, a woman is walking her dog",
      "authors"=>{"author"=>{"id"=>"9013543", "name"=>"Ruth Ware"}}
    }
  }

  subject { Book.new(attrs) }

  it "exists" do
    expect(subject).to be_a Book
    expect(subject.isbn).to eq ("1501156209")
    expect(subject.title).to eq ("The Lying Game")
    expect(subject.image_url).to eq ("https://images.gr-assets.com/books/1520163193m/36622726.jpg")
    expect(subject.small_image_url).to eq ("https://images.gr-assets.com/books/1520163193s/36622726.jpg")
    expect(subject.link).to eq ("https://www.goodreads.com/book/show/36622726-the-lying-game")
    expect(subject.num_pages).to eq ("416")
    expect(subject.format).to eq ("Paperback")
    expect(subject.publisher).to eq ("Gallery/Scout Press")
    expect(subject.publication_year).to eq ("2018")
    expect(subject.average_rating).to eq ("3.53")
    expect(subject.ratings_count).to eq ("33253")
    expect(subject.description).to eq ("On a cool June morning, a woman is walking her dog")
    expect(subject.authors).to eq ({"author"=>{"id"=>"9013543", "name"=>"Ruth Ware"}})
  end
end
