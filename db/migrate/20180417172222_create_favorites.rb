class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :reviews, foreign_key: true
      t.string :list_name
      t.string :published_date
      t.string :title
      t.string :description
      t.string :author
      t.string :isbns

      t.timestamps
    end
  end
end
