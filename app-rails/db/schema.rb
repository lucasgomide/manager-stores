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

ActiveRecord::Schema.define(version: 2018_08_02_014407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "posts", force: :cascade do |t|
    t.string "a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatials", force: :cascade do |t|
    t.geometry "geo", limit: {:srid=>0, :type=>"geometry"}
    t.geometry "poly", limit: {:srid=>0, :type=>"multi_polygon"}
    t.point "latlon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo"], name: "index_spatials_on_geo", using: :gist
    t.index ["latlon"], name: "index_spatials_on_latlon", using: :gist
    t.index ["poly"], name: "index_spatials_on_poly", using: :gist
  end

end
