class Favorite < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :description, :author, :isbns
end
