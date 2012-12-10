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

ActiveRecord::Schema.define(:version => 20130130150928) do

  create_table "bible_infos", :force => true do |t|
    t.string   "version"
    t.string   "book"
    t.integer  "chapters"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bible_infos", ["version"], :name => "index_bible_infos_on_version"

  create_table "passages", :force => true do |t|
    t.string   "version"
    t.string   "book"
    t.string   "en_book"
    t.text     "text"
    t.integer  "chapter"
    t.integer  "verse"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "passages", ["book"], :name => "index_passages_on_book"
  add_index "passages", ["chapter"], :name => "index_passages_on_chapter"
  add_index "passages", ["en_book"], :name => "index_passages_on_en_book"
  add_index "passages", ["verse"], :name => "index_passages_on_verse"
  add_index "passages", ["version", "book", "en_book", "chapter", "verse"], :name => "passage_composite"
  add_index "passages", ["version"], :name => "index_passages_on_version"

  create_table "plan_details", :force => true do |t|
    t.string   "passage_ref"
    t.date     "assigned_date"
    t.integer  "plan_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "plan_details", ["assigned_date"], :name => "index_plan_details_on_assigned_date"
  add_index "plan_details", ["passage_ref"], :name => "index_plan_details_on_passage_ref"
  add_index "plan_details", ["plan_id"], :name => "index_plan_details_on_plan_id"

  create_table "plan_template_details", :force => true do |t|
    t.integer  "plan_template_id"
    t.string   "passage_ref"
    t.integer  "order"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "plan_template_details", ["passage_ref"], :name => "index_plan_template_details_on_passage_ref"
  add_index "plan_template_details", ["plan_template_id", "order"], :name => "index_plan_template_details_on_plan_template_id_and_order"
  add_index "plan_template_details", ["plan_template_id", "passage_ref"], :name => "index_plan_template_details_on_plan_template_id_and_passage_ref"

  create_table "plan_templates", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plan_templates", ["name", "order"], :name => "index_plan_templates_on_name_and_order"

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plans", ["name"], :name => "index_plans_on_name"
  add_index "plans", ["user_id"], :name => "index_plans_on_user_id"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
