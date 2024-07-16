class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.integer :nb_dweling
      t.float :area_sqm_land
      t.float :area_sqm_livable
      t.float :floor_area_ratio

      t.timestamps
    end
  end
end
