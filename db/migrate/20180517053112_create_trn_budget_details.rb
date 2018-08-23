class CreateTrnBudgetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_budget_details, id: false do |t|

      t.column :bg_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT', limit: 8, null: false
      t.string :bg_title, limit: 256
      t.integer :bg_kind, limit: 8, null: false
      t.text :bg_detail
      t.integer :bg_unit_price, limit: 4, null: false
      t.integer :bg_quantity, limit: 1
      t.integer :bg_total_price, limit: 8
      t.string :file, limit: 256
      t.text :bg_remarks

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
