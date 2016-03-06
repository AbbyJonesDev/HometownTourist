# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160306012926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "description", null: false
    t.string "icon"
  end

  create_table "categories_stops", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "stop_id",     null: false
  end

  add_index "categories_stops", ["category_id", "stop_id"], name: "index_categories_stops_on_category_id_and_stop_id", unique: true, using: :btree

  create_table "categories_tags", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "tag_id",      null: false
  end

  add_index "categories_tags", ["category_id", "tag_id"], name: "index_categories_tags_on_category_id_and_tag_id", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "location",       null: false
    t.text     "description",    null: false
    t.string   "website",        null: false
    t.string   "featured_image", null: false
    t.date     "start_date",     null: false
    t.date     "end_date",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "events_categories", id: false, force: :cascade do |t|
    t.integer "event_id",    null: false
    t.integer "category_id", null: false
  end

  add_index "events_categories", ["event_id", "category_id"], name: "index_events_categories_on_event_id_and_category_id", unique: true, using: :btree

  create_table "events_tags", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "tag_id",   null: false
  end

  add_index "events_tags", ["event_id", "tag_id"], name: "index_events_tags_on_event_id_and_tag_id", unique: true, using: :btree

  create_table "stops", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "location",                       null: false
    t.text     "description",                    null: false
    t.string   "website",                        null: false
    t.boolean  "featured",       default: false
    t.string   "featured_image",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

end
