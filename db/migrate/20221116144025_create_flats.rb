class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :city
      t.integer :rating
      t.string :description
      t.integer :bedrooms
      t.integer :number_of_guests
      t.integer :price_per_night
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
