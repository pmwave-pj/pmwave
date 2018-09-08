class CreateTrnDailyreportDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_dailyreport_details,id: false do |t|
      t.column :dailyreport_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.datetime :create_ymd, null: false
      t.text :work_plan_today
      t.text :work_result
      t.text :work_verification
      t.text :work_plan_tomorrow
      t.text :work_impression
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