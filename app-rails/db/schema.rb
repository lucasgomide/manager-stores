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

ActiveRecord::Schema.define(version: 2018_08_02_175728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "addresses", force: :cascade do |t|
    t.bigint "store_id"
    t.point "coordinates", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_addresses_on_store_id"
  end

  create_table "coverage_areas", force: :cascade do |t|
    t.bigint "store_id"
    t.geometry "coordinates", limit: {:srid=>0, :type=>"multi_polygon"}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinates"], name: "index_coverage_areas_on_coordinates", using: :gist
    t.index ["store_id"], name: "index_coverage_areas_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "document"
    t.string "owner_name"
    t.string "tranding_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "stores"
  add_foreign_key "coverage_areas", "stores"
end