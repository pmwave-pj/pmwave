class CreateTrnDailyreportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_dailyreport_comments,id: false do |t|
      t.column :dr_comment_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.references :trn_dailyreport_detail, limit: 4, null: false
      t.text :comment_detail
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