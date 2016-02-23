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

ActiveRecord::Schema.define(version: 20141127233904) do

  create_table "availabilities", force: true do |t|
    t.string   "pid"
    t.integer  "version_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "is_fully_loaded", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broadcasts", force: true do |t|
    t.string   "pid"
    t.date     "schedule_date"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "duration"
    t.boolean  "is_fully_loaded", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service"
  end

  create_table "categories", force: true do |t|
    t.string   "style"
    t.string   "key"
    t.string   "bbc_id"
    t.string   "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "contributors", force: true do |t|
    t.string   "character_name"
    t.string   "name"
    t.string   "family_name"
    t.string   "given_name"
    t.string   "role"
    t.boolean  "is_fully_loaded", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ownerships", force: true do |t|
    t.string   "style"
    t.string   "bbc_id"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programme_categories", force: true do |t|
    t.integer  "programme_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programme_peers", force: true do |t|
    t.integer  "from_programme_id"
    t.integer  "to_programe_id"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmes", force: true do |t|
    t.string   "pid"
    t.string   "style"
    t.string   "title"
    t.string   "subtitle"
    t.string   "short_synopsis"
    t.string   "medium_synopsis"
    t.string   "long_synopsis"
    t.integer  "ownership_id"
    t.boolean  "is_fully_loaded", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "schedule_entries", force: true do |t|
    t.string   "key"
    t.string   "pid"
    t.string   "title"
    t.string   "service"
    t.string   "synopsis"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "loaded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segment_events", force: true do |t|
    t.string   "pid"
    t.integer  "segment_id"
    t.integer  "version_offset"
    t.string   "title"
    t.boolean  "is_chapter"
    t.boolean  "has_snippet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: true do |t|
    t.string   "pid"
    t.integer  "duration"
    t.string   "artist"
    t.string   "track_title"
    t.integer  "track_number"
    t.string   "record_label"
    t.string   "release_title"
    t.string   "record_id"
    t.string   "snippet_url"
    t.string   "title"
    t.string   "short_synopsis"
    t.string   "medium_synopsis"
    t.string   "long_synopsis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.integer  "programme_id"
    t.string   "pid"
    t.integer  "duration"
    t.boolean  "is_fully_loaded", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
