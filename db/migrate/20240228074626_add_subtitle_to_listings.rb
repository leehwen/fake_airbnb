class AddSubtitleToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :subtitle, :string
  end
end
