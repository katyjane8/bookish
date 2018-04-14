class CreateBookstores < ActiveRecord::Migration[5.1]
  def change
    create_table :bookstores do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :name

      t.timestamps
    end
  end
end
