class CreateTrnTaskDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_task_details,id: false do |t|
      t.column :task_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.boolean :step_ownership_flg, limit: 1, null: false
      t.string :task_title, limit: 256, null: false
      t.integer :relation_step_id, limit: 4
      t.integer :tanto_user_id, limit: 4
      t.integer :relation_kadai_id, limit: 4
      t.integer :progress_rate, limit: 4
      t.datetime :kaishiyotei_ymd
      t.datetime :syuryouyotei_ymd
      t.datetime :start_ymd
      t.datetime :end_ymd
      t.string :task_detail, limit: 256
      t.string :topics, limit: 256
      t.string :pm_comment, limit: 256
      t.integer :inst_user_id, limit: 4, null: false
      t.integer :hojn_id, limit: 4, null: false
      t.integer :relation_pj, limit: 4, null: false
      t.datetime :inst_ymd, null: false
      t.datetime :updt_ymd, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :del_ymd
      t.boolean :del_flg, null: false
      t.string :updt_pgm_id, limit: 256
      t.string :updt_history, limit: 256
      t.string :updt_history_tanto, limit: 256
    end
  end
end