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

ActiveRecord::Schema.define(:version => 20120407152209) do

  create_table "awards", :force => true do |t|
    t.string   "name"
    t.string   "formula"
    t.boolean  "isindividual"
    t.boolean  "isteam"
    t.string   "company_type"
    t.string   "company_size_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "goal"
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
    t.string   "company_size_range"
    t.string   "twitter_handle"
    t.integer  "total_commutes"
    t.float    "mileage"
    t.integer  "commuters"
    t.integer  "zero_commutes"
    t.float    "team_participation"
    t.integer  "newbies"
    t.integer  "leader"               #id for a team leader user points to users table below
    t.boolean  "shirt"
    t.string   "shirt_size"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.boolean  "btww_email_list"
    t.boolean  "general_email_list"
  end

  create_table "users", :force => true do |t|
    t.string   "fname"                #Team leader fname lives here
    t.string   "lname"                #Team leader lname lives here
    t.integer  "team_id"
    t.boolean  "isadmin"
    t.boolean  "isnewbie"
    t.string   "email"                #Team leader email lives here via id above
    t.string   "bikerclass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "btww_email_list"
    t.boolean  "general_email_list"
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
