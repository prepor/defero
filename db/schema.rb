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

ActiveRecord::Schema.define(:version => 20090330132847) do

  create_table "messages", :force => true do |t|
    t.text     "message"
    t.string   "login"
    t.string   "chat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chat_id", "created_at"], :name => "index_messages_on_chat_id_and_created_at"
  add_index "messages", ["chat_id"], :name => "index_messages_on_chat_id"
  add_index "messages", ["created_at"], :name => "index_messages_on_created_at"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "secret_key"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "anonymous",  :default => true
  end

  add_index "sites", ["user_id"], :name => "index_sites_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["token"], :name => "index_users_on_token"

end
