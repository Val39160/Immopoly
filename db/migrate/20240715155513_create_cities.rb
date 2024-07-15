class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.float :liveable_selling_price
      t.float :land_selling_price
      t.float :rental_liveable_price

      t.timestamps
    end
  end
end
