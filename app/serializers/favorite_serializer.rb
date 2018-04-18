class FavoriteSerializer < ActiveModel::Serializer
  attributes :list_name, :published_date, :title, :description, 
             :author, :isbns
  belongs_to :user
end
