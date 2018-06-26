class CreateTrnPerformanceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_performance_details, id: false do |t|

      t.integer :pj_id, limit: 8, null: false
      t.integer :subpj_id, limit: 8, null: false
      t.integer :team_id, limit: 8, null: false

      t.integer :pj_name, limit: 8, null: false
      t.integer :subpj_name, limit: 8, null: false
      t.integer :team_name, limit: 8, null: false

      t.column :pfm_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT', limit: 8, null: false
      t.string :pfm_title, limit: 256
      t.integer :bg_kind, limit: 8, null: false
      t.string :bg_detail, limit: 256, null: false
      t.integer :pfm_unit_price, limit: 4, null: false
      t.integer :pfm_quantity, limit: 1
      t.integer :pfm_total_price, limit: 8
      t.string :file, limit: 256
      t.string :pfm_remarks, limit: 256

      t.integer :inst_user_id, limit: 8, null: false
      t.datetime :inst_ymd, default: -> { 'CURRENT_TIMESTAMP' },  null: false
      t.datetime :updt_ymd, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :del_ymd, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :del_flg, limit: 8, null: false
      t.string :updt_pgm_id, limit: 256
      t.string :updt_history, limit: 256
      t.string :updt_history_tanto, limit: 256

    end
  end
end
