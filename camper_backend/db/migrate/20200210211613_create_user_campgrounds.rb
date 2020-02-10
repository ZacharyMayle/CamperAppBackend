class CreateUserCampgrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_campgrounds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :campground, null: false, foreign_key: true
      t.integer :camping_duration

      t.timestamps
    end
  end
end
