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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120304050147) do

  create_table "awards", :force => true do |t|
    t.string   "name"
    t.string   "formula"
    t.boolean  "isindividual"
    t.boolean  "isteam"
    t.string   "company_type"
    t.string   "company_size_range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commutes", :force => true do |t|
    t.integer  "user_id"
    t.date     "commute_date"
    t.integer  "sequence"
    t.string   "departure_address"
    t.string   "arrival_address"
    t.float    "distance"
    t.string   "ridescore"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "company"
    t.string   "company_type"
    t.integer  "size"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "team_id"
    t.boolean  "isleader"
    t.boolean  "isadmin"
    t.boolean  "isnewbie"
    t.string   "email"
    t.string   "bikerclass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "won_awards", :force => true do |t|
    t.integer  "award_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
