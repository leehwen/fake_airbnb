class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :category
      t.integer :no_of_rooms
      t.string :location
      t.integer :price_per_night
      t.integer :no_of_guests
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
