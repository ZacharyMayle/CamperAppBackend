# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_11_232037) do

  create_table "campgrounds", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "park_code"
    t.integer "total_sites"
    t.string "latlong"
    t.string "weather"
    t.string "wheel_chair"
    t.string "cell_phone"
    t.string "fire_stove"
    t.string "toilets"
    t.string "showers"
    t.string "laundry"
    t.integer "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_campgrounds_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "latlong"
    t.string "designation"
    t.string "description"
    t.string "url"
    t.string "park_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_campgrounds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "campground_id", null: false
    t.integer "camping_duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campground_id"], name: "index_user_campgrounds_on_campground_id"
    t.index ["user_id"], name: "index_user_campgrounds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "current_state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campgrounds", "parks"
  add_foreign_key "user_campgrounds", "campgrounds"
  add_foreign_key "user_campgrounds", "users"
end
