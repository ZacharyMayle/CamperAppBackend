class CreateCampgrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.string :description
      t.string :park_code
      t.integer :total_sites
      t.string :latlong
      t.string :weather
      t.string :wheel_chair
      t.string :cell_phone
      t.string :fire_stove
      t.string :toilets
      t.string :showers
      t.string :laundry
      t.boolean :big_foot_sightings
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
