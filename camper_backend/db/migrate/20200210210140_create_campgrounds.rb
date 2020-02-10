class CreateCampgrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.string :description
      t.string :park_code
      t.string :total_sites
      t.string :latlong

      t.timestamps
    end
  end
end
