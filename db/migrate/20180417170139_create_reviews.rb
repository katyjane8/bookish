class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :list_name
      t.string :bestsellers_date
      t.string :published_date
      t.string :rank
      t.string :weeks_on_list
      t.string :title
      t.string :description
      t.string :author
      t.string :isbns

      t.timestamps
    end
  end
end
