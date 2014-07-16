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

ActiveRecord::Schema.define(:version => 20140714051134) do

  create_table "account_contacts", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "skype"
    t.string   "msn"
    t.string   "icq"
    t.integer  "role_id"
    t.boolean  "main_contact"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "account_reps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.integer  "rep_level",  :limit => 1
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "accounts", :force => true do |t|
    t.string   "number",               :limit => 5
    t.string   "short_name",           :limit => 50
    t.string   "official_name"
    t.text     "address"
    t.string   "legal_email"
    t.string   "dispute_email"
    t.integer  "credit_limit"
    t.text     "credit_limit_history"
    t.integer  "max_block_limit"
    t.string   "payment_term",         :limit => 15
    t.integer  "payment_cycle"
    t.string   "customer_type",        :limit => 1
    t.decimal  "last_invoice_amount",                :precision => 11, :scale => 2
    t.datetime "last_invoice_date"
    t.decimal  "current_balance",                    :precision => 11, :scale => 2
    t.datetime "current_balance_date"
    t.string   "grade",                :limit => 15
    t.boolean  "status",                                                            :default => true
    t.string   "status_history"
    t.boolean  "opt_in"
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
  end

  create_table "bootsy_image_galleries", :force => true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "bootsy_images", :force => true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "crp", :force => true do |t|
    t.integer  "country_code"
    t.string   "country_name"
    t.decimal  "selling_rate",                   :precision => 11, :scale => 4
    t.integer  "billing_increment"
    t.decimal  "asr",                            :precision => 11, :scale => 2
    t.decimal  "acd",                            :precision => 11, :scale => 2
    t.decimal  "pdd",                            :precision => 11, :scale => 2
    t.string   "capacity"
    t.decimal  "buy_lower_range",                :precision => 11, :scale => 2
    t.decimal  "buy_upper_range",                :precision => 11, :scale => 2
    t.decimal  "sell_lower_range",               :precision => 11, :scale => 2
    t.decimal  "sell_upper_range",               :precision => 11, :scale => 2
    t.string   "vendor1"
    t.string   "vendor2"
    t.string   "vendor3"
    t.string   "vendor4"
    t.string   "route_type",        :limit => 1
    t.string   "service_level"
    t.string   "quality"
    t.string   "remarks"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "email_templates", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "body"
    t.string   "from"
    t.boolean  "is_default"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "header"
    t.text     "signature"
    t.string   "target"
    t.integer  "role_id"
    t.string   "template_type"
  end

  create_table "prospects", :force => true do |t|
    t.string   "company_name"
    t.string   "email1"
    t.string   "email2"
    t.string   "phone"
    t.string   "prospect_type", :limit => 1
    t.string   "status"
    t.text     "remarks"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "reference_id"
  end

  create_table "references", :force => true do |t|
    t.integer  "account_id"
    t.string   "company"
    t.string   "email"
    t.string   "contact"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "role_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "top_routes", :force => true do |t|
    t.integer  "country_code"
    t.string   "country_name"
    t.decimal  "selling_rate",         :precision => 11, :scale => 4
    t.decimal  "asr",                  :precision => 11, :scale => 2
    t.decimal  "acd",                  :precision => 11, :scale => 2
    t.string   "capacity"
    t.string   "service_level"
    t.string   "quality"
    t.string   "remarks"
    t.boolean  "select_for_promotion"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "number",                 :limit => 4
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.string   "signature"
    t.string   "msn"
    t.string   "phone"
    t.boolean  "admin",                               :default => false
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",                  :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
