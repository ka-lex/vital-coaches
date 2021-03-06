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

ActiveRecord::Schema.define(:version => 20141123093754) do

  create_table "diary_entries", :force => true do |t|
    t.date     "entry_date"
    t.decimal  "weight",     :precision => 5, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "diary_entries", ["user_id"], :name => "index_diary_entries_on_user_id"

  create_table "profiles", :force => true do |t|
    t.integer  "body_height"
    t.decimal  "weight",                :precision => 6, :scale => 2
    t.integer  "user_id"
    t.date     "birthday"
    t.integer  "abdominal_measurement"
    t.string   "street"
    t.string   "street_number"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "country"
    t.string   "bank_name"
    t.string   "bank_account"
    t.string   "bank_code"
    t.string   "bank_account_owner"
    t.text     "anamnesis"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.string   "authentication_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "workouts", ["user_id"], :name => "index_workouts_on_user_id"

end
