# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100913090601) do

  create_table "articles", :force => true do |t|
    t.string   "title",                     :null => false
    t.text     "content",                   :null => false
    t.string   "author"
    t.string   "afrom"
    t.integer  "count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "type_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.integer  "info"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cinemas", :force => true do |t|
    t.string   "name",                      :null => false
    t.string   "address",                   :null => false
    t.string   "phone"
    t.integer  "hall",       :default => 0, :null => false
    t.string   "info",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "viphall",    :default => 0
    t.integer  "loverhall",  :default => 0
    t.integer  "imaxhall",   :default => 0
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.string   "content",                       :null => false
    t.boolean  "isreplay",   :default => false
    t.string   "orderid"
    t.string   "ipaddress"
    t.integer  "cinema_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", :force => true do |t|
    t.string   "name"
    t.string   "actors"
    t.text     "description"
    t.string   "img"
    t.string   "country"
    t.string   "director"
    t.datetime "released_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.boolean  "status",                       :null => false
    t.integer  "duration",      :default => 0
  end

  create_table "friend_links", :force => true do |t|
    t.string   "title",      :limit => 20, :default => "", :null => false
    t.string   "url",                      :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "film_name",                      :null => false
    t.string   "country",                        :null => false
    t.string   "film_type",                      :null => false
    t.string   "room",                           :null => false
    t.integer  "price",                          :null => false
    t.datetime "stime",                          :null => false
    t.integer  "service_price",                  :null => false
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cinema_id",                      :null => false
    t.integer  "film_id",                        :null => false
    t.boolean  "status",                         :null => false
    t.integer  "film_length",                    :null => false
    t.integer  "priority_",     :default => 100
  end

  create_table "types", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "code",       :default => "1000"
    t.string   "info"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isMenu",     :default => false
  end

end
