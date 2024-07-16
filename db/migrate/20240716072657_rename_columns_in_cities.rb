class RenameColumnsInCities < ActiveRecord::Migration[7.1]
  def change
    rename_column :cities, :liveable_selling_price, :price_per_sqm_livable
    rename_column :cities, :land_selling_price, :price_per_sqm_land
    rename_column :cities, :rental_liveable_price, :price_per_sqm_rental
  end
end
