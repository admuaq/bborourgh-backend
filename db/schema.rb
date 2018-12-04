# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_12_154328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borough_postcodes", force: :cascade do |t|
    t.bigint "borough_id"
    t.bigint "postcode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borough_id"], name: "index_borough_postcodes_on_borough_id"
    t.index ["postcode_id"], name: "index_borough_postcodes_on_postcode_id"
  end

  create_table "boroughs", force: :cascade do |t|
    t.text "name"
    t.integer "averageIncomeBorough"
    t.decimal "health"
    t.decimal "happiness"
    t.decimal "education"
    t.decimal "population"
    t.text "logoLink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "ssn"
    t.string "encrypted_ssn"
    t.string "encrypted_ssn_iv"
    t.string "app_id"
    t.string "encrypted_appid"
    t.string "encrypted_appid_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postcodes", force: :cascade do |t|
    t.string "outcode"
    t.string "latitude"
    t.string "longitude"
    t.integer "averageSalaryPostedJob"
    t.integer "crimeRate"
    t.integer "houseListings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
