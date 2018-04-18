require 'rails_helper'

RSpec.describe Book, type: :model do
    it "is valid with valid attributes" do
    expect(Book.new).to be_valid
  end
    it "is not valid without a title"
end
