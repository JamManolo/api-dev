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

ActiveRecord::Schema.define(version: 20131024161210) do

  create_table "data_files", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.boolean  "has_corrections"
    t.string   "format"
    t.string   "data_store"
    t.integer  "data_store_id"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fixtures", force: true do |t|
    t.integer  "match_id"
    t.string   "date"
    t.string   "league"
    t.integer  "league_id"
    t.integer  "round"
    t.string   "home_team"
    t.integer  "home_team_id"
    t.string   "away_team"
    t.integer  "away_team_id"
    t.string   "location"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.string   "time_x"
  end

  create_table "leagues", force: true do |t|
    t.integer  "league_id"
    t.string   "name"
    t.string   "country"
    t.boolean  "historical_data"
    t.boolean  "fixtures"
    t.boolean  "livescore"
    t.integer  "number_of_matches"
    t.string   "latest_match_date"
    t.integer  "data_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "latest_round"
    t.integer  "final_round"
  end

  create_table "reports", force: true do |t|
    t.integer  "report_id"
    t.integer  "fixture_match_id"
    t.string   "date"
    t.integer  "round"
    t.string   "league"
    t.integer  "league_id"
    t.string   "home_team"
    t.integer  "home_team_id"
    t.string   "away_team"
    t.integer  "away_team_id"
    t.integer  "data_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "country"
    t.string   "stadium"
    t.string   "home_page_url"
    t.string   "wiki_link"
    t.integer  "data_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "league"
    t.integer  "league_id"
  end

end
