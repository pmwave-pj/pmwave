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

ActiveRecord::Schema.define(version: 2018_07_31_004721) do

  create_table "mst_groups", primary_key: "group_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "hojn_id", null: false
    t.integer "pj_id", null: false
    t.string "group_nm", limit: 256, null: false
    t.boolean "account_edit_flg", default: false, null: false
    t.boolean "pj_mg_edit_flg", default: false, null: false
    t.boolean "top_msg_edit_flg", default: false, null: false
    t.boolean "com_mg_edit_flg", default: false, null: false
    t.boolean "progress_mg_edit_flg", default: false, null: false
    t.boolean "trq_mg_approval_flg", default: false, null: false
    t.boolean "trq_mg_edit_flg", default: false, null: false
    t.boolean "budget_mg_approval_flg", default: false, null: false
    t.boolean "budget_mg_edit_flg", default: false, null: false
    t.boolean "talent_mg_approval_flg", default: false, null: false
    t.boolean "talent_mg_edit_flg", default: false, null: false
    t.integer "inst_user_id", null: false
    t.datetime "inst_ymd", null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd"
    t.boolean "del_flg", default: false, null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "mst_kadai_cgrs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pj_id", null: false
    t.integer "hojn_id", null: false
    t.integer "menu_id", null: false
    t.integer "kadai_cgr_id", null: false
    t.string "kadai_cgr_name", null: false
    t.datetime "kadai_inst_ymd", null: false
    t.datetime "kadai_updt_ymd"
    t.datetime "kadai_del_ymd"
    t.integer "kadai_del_flag"
    t.integer "kadai_updt_id"
    t.datetime "kadai_updt_s_end"
    t.datetime "kadai_updt_t_end"
  end

  create_table "mst_kadai_phases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pj_id", null: false
    t.integer "hojn_id", null: false
    t.integer "menu_id", null: false
    t.integer "kadai_phase_id", null: false
    t.string "kadai_phase_name", null: false
    t.datetime "kadai_inst_ymd", null: false
    t.datetime "kadai_updt_ymd"
    t.datetime "kadai_del_ymd"
    t.integer "kadai_del_flag"
    t.integer "kadai_updt_id"
    t.datetime "kadai_updt_s_end"
    t.datetime "kadai_updt_t_end"
  end

  create_table "mst_kadai_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pj_id", null: false
    t.integer "hojn_id", null: false
    t.integer "menu_id", null: false
    t.integer "kadai_status_id", null: false
    t.string "kadai_status_name", null: false
    t.datetime "kadai_inst_ymd", null: false
    t.datetime "kadai_updt_ymd"
    t.datetime "kadai_del_ymd"
    t.integer "kadai_del_flag"
    t.integer "kadai_updt_id"
    t.datetime "kadai_updt_s_end"
    t.datetime "kadai_updt_t_end"
  end

  create_table "mst_pjs", primary_key: "pj_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hojn_id", null: false
    t.string "pj_name", limit: 256, null: false
    t.string "pj_overview", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "mst_subpjs", primary_key: "subpj_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hojn_id", null: false
    t.bigint "pj_id", null: false
    t.string "pj_name", limit: 256, null: false
    t.string "pj_overview", limit: 256
    t.string "subpj_name", limit: 256, null: false
    t.string "subpj_overview", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "mst_teams", primary_key: "team_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hojn_id", null: false
    t.bigint "pj_id", null: false
    t.string "pj_name", limit: 256, null: false
    t.string "pj_overview", limit: 256
    t.bigint "subpj_id", null: false
    t.string "subpj_name", limit: 256, null: false
    t.string "subpj_overview", limit: 256
    t.string "team_name", limit: 256, null: false
    t.string "team_overview", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "mst_users", primary_key: "user_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_cd", limit: 256, null: false
    t.string "password_digest", limit: 256, null: false
    t.string "remember_token", limit: 256
    t.string "user_nm", limit: 256, null: false
    t.string "user_nm_kana", limit: 256
    t.integer "group_id"
    t.integer "hojn_id", null: false
    t.string "company_nm", limit: 256
    t.string "department_nm", limit: 256
    t.integer "pj_id", null: false
    t.string "tel_1", limit: 256
    t.string "tel_2", limit: 256
    t.string "tel_3", limit: 256
    t.datetime "birthday_ymd"
    t.datetime "entry_ymd"
    t.string "twitter_url", limit: 256
    t.string "facebook_url", limit: 256
    t.string "account1", limit: 256
    t.string "account2", limit: 256
    t.integer "timezone", null: false
    t.integer "region", null: false
    t.integer "language", null: false
    t.string "address_country", limit: 256
    t.string "address_zip_code", limit: 256
    t.string "address_prefectures", limit: 256
    t.string "address_city", limit: 256
    t.string "address_street", limit: 256
    t.string "comment", limit: 256
    t.text "notices"
    t.integer "inst_user_id", null: false
    t.datetime "inst_ymd", null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd"
    t.boolean "del_flg", default: false, null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "phaseitems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phaseitem"
    t.string "imptitem"
    t.string "statusitem"
    t.string "cgritem"
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "shosai"
    t.datetime "kigen"
    t.boolean "kanryo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trn_budget_details", primary_key: "bg_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pj_id", null: false
    t.bigint "subpj_id", null: false
    t.bigint "team_id", null: false
    t.bigint "pj_name", null: false
    t.bigint "subpj_name", null: false
    t.bigint "team_name", null: false
    t.string "bg_title", limit: 256
    t.bigint "bg_kind", null: false
    t.string "bg_detail", limit: 256, null: false
    t.integer "bg_unit_price", null: false
    t.integer "bg_quantity", limit: 1
    t.bigint "bg_total_price"
    t.string "file", limit: 256
    t.string "bg_remarks", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "trn_kadai_kanris", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pj_id"
    t.integer "INTEGER PRIMARY KEY AUTO_INCREMENT"
    t.integer "hojn_id", null: false
    t.integer "menu_id"
    t.integer "kadai_s_id"
    t.string "kadai_title", null: false
    t.string "kadai_psner", null: false
    t.text "kadai_contents", null: false
    t.string "kadai_person", null: false
    t.datetime "kadai_limit", null: false
    t.integer "kadai_phase", null: false
    t.integer "kadai_impt", null: false
    t.integer "kadai_status", null: false
    t.integer "kadai_cgr", null: false
    t.string "kadai_tenp"
    t.text "kadai_try"
    t.text "kadai_try2"
    t.text "kadai_try3"
    t.datetime "kadai_try_d"
    t.datetime "kadai_try2_d"
    t.datetime "kadai_try3_d"
    t.string "kadai_try_w"
    t.string "kadai_try2_w"
    t.string "kadai_try3_w"
    t.string "kadai_try_p"
    t.string "kadai_try2_p"
    t.string "kadai_try3_p"
    t.string "kadai_cmt_psner"
    t.text "kadai_cmt_ents"
    t.string "kadai_cmt_notifier"
    t.datetime "kadai_inst_ymd"
    t.datetime "kadai_updt_ymd"
    t.datetime "kadai_del_ymd"
    t.bigint "kadai_del_flag"
    t.string "kadai_updt_id", limit: 256
    t.string "kadai_updt_s_end", limit: 256
    t.string "kadai_updt_t_end", limit: 256
    t.boolean "kadai_kanryo"
  end

  create_table "trn_manhr_details", primary_key: "mh_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pj_id", null: false
    t.bigint "subpj_id", null: false
    t.bigint "team_id", null: false
    t.bigint "pj_name", null: false
    t.bigint "subpj_name", null: false
    t.bigint "team_name", null: false
    t.string "mh_task_name", limit: 256
    t.time "mh_work_time", null: false
    t.string "mh_remarks", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
  end

  create_table "trn_performance_details", primary_key: "pfm_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pj_id", null: false
    t.bigint "subpj_id", null: false
    t.bigint "team_id", null: false
    t.bigint "pj_name", null: false
    t.bigint "subpj_name", null: false
    t.bigint "team_name", null: false
    t.string "pfm_title", limit: 256
    t.bigint "bg_kind", null: false
    t.string "bg_detail", limit: 256, null: false
    t.integer "pfm_unit_price", null: false
    t.integer "pfm_quantity", limit: 1
    t.bigint "pfm_total_price"
    t.string "file", limit: 256
    t.string "pfm_remarks", limit: 256
    t.bigint "inst_user_id", null: false
    t.datetime "inst_ymd", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updt_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "del_ymd", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "del_flg", null: false
    t.string "updt_pgm_id", limit: 256
    t.string "updt_history", limit: 256
    t.string "updt_history_tanto", limit: 256
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
