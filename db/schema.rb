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

ActiveRecord::Schema.define(:version => 20100711214019) do

  create_table "changes", :force => true do |t|
    t.string   "mode"
    t.string   "path"
    t.string   "from_path"
    t.string   "from_revision"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sha"
    t.integer  "commit_id"
    t.integer  "parent_id"
  end

  create_table "commits", :force => true do |t|
    t.integer  "repository_id"
    t.string   "sha"
    t.string   "message"
    t.string   "name"
    t.string   "email"
    t.integer  "actor_id"
    t.datetime "committed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "branch"
    t.integer  "changes_count"
    t.string   "tree"
    t.string   "parent_sha"
    t.integer  "parent_id"
  end

  create_table "hooks", :force => true do |t|
    t.integer  "repository_id"
    t.string   "name"
    t.text     "options"
    t.boolean  "active",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "slug"
    t.string   "synced_revision"
    t.datetime "synced_revision_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commits_count"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "timeline_events", :force => true do |t|
    t.string   "event_type"
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "secondary_subject_id"
    t.string   "secondary_subject_type"
    t.text     "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :null => false
    t.string   "email",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "permalink"
  end

end
