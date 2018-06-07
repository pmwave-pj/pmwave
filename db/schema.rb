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

ActiveRecord::Schema.define(version: 2018_05_22_163159) do

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "shosai"
    t.datetime "kigen"
    t.boolean "kanryo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trn_task_details", primary_key: "task_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "step_ownership_flg", null: false
    t.string "task_title", limit: 256, null: false
    t.integer "relation_step_id"
    t.integer "tanto_user_id"
    t.integer "relation_kadai_id"
    t.integer "progress_rate"
    t.datetime "kaishiyotei_ymd"
    t.datetime "syuryouyotei_ymd"
    t.datetime "start_ymd"
    t.datetime "end_ymd"
    t.boolean "end_flg", null: false
    t.text "task_detail"
    t.string "topics", limit: 256
    t.string "pm_comment", limit: 256
    t.integer "inst_user_id", null: false
    t.integer "hojn_id", null: false
    t.integer "pj_id", null: false
    t.datetime "inst_ymd", null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd"
    t.boolean "del_flg", default: false, null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
