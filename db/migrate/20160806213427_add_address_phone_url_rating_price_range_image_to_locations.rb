class AddAddressPhoneUrlRatingPriceRangeImageToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address, :string
    add_column :locations, :phone, :string
    add_column :locations, :url, :string
    add_column :locations, :rating, :string
    add_column :locations, :price_range, :string
    add_column :locations, :image, :string
  end
end
