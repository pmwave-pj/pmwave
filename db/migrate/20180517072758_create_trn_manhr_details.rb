class CreateTrnManhrDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_manhr_details, id: false do |t|

      t.column :mh_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT', limit: 8, null: false

      t.string :mh_task_name, limit: 256
      t.time:mh_work_time
      t.text :mh_detail
      t.string :mh_remarks, limit: 256

      t.integer :relation_step_id, limit: 4
      t.integer :tanto_user_id, limit: 4
      t.integer :relation_kadai_id, limit: 4
      t.integer :progress_rate, limit: 4
      t.datetime :kaishiyotei_ymd
      t.datetime :syuryouyotei_ymd
      t.datetime :start_ymd
      t.datetime :end_ymd
      t.boolean :end_flg

      t.integer :inst_user_id, limit: 4, null: false
      t.integer :hojn_id, limit: 4, null: false
      t.integer :pj_id, limit: 4, null: false
      t.datetime :inst_ymd, null: false
      t.datetime :updt_ymd, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :del_ymd
      t.boolean :del_flg, null: false, :default => false
      t.string :updt_pgm_id, limit: 256
      t.string :updt_history, limit: 256
      t.string :updt_history_tanto, limit: 256

    end
  end
end
