class CreateMstGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_groups,id: false do |t|
      t.column :group_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.integer :hojn_id, limit: 4, null: false
      t.integer :pj_id, limit: 4, null: false
      t.string :group_nm, limit: 256, null: false
      t.boolean :account_edit_flg, null: false, :default => false
      t.boolean :pj_mg_edit_flg, null: false, :default => false
      t.boolean :top_msg_edit_flg, null: false, :default => false
      t.boolean :com_mg_edit_flg, null: false, :default => false
      t.boolean :progress_mg_edit_flg, null: false, :default => false
      t.boolean :trq_mg_approval_flg, null: false, :default => false
      t.boolean :trq_mg_edit_flg, null: false, :default => false
      t.boolean :budget_mg_approval_flg, null: false, :default => false
      t.boolean :budget_mg_edit_flg, null: false, :default => false
      t.boolean :talent_mg_approval_flg, null: false, :default => false
      t.boolean :talent_mg_edit_flg, null: false, :default => false
      t.integer :inst_user_id, limit: 4, null: false
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
