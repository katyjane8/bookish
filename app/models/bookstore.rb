class Bookstore < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, zipcode, state].compact.join(", ")
  end
end
