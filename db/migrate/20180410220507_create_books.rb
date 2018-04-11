class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    create_table :books do |t|
      t.references :user, foreign_key: true
      t.string :isbn
      t.string :title
      t.string :image_url
      t.string :small_image_url
      t.string :link
      t.string :num_pages
      t.string :format
      t.string :publisher
      t.string :publication_year
      t.string :average_rating
      t.string :ratings_count
      t.hstore :description
      t.hstore :authors

      t.timestamps
    end
  end
end
