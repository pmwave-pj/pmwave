class CreateMstTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_teams, id: false do |t|

      t.integer :hojn_id, limit: 8, null: false
      t.integer :pj_id, limit: 8, null: false
      t.string  :pj_name, limit: 256, null: false
      t.string  :pj_overview, limit: 256

      t.integer :subpj_id, limit: 8, null: false
      t.string  :subpj_name, limit: 256, null: false
      t.string  :subpj_overview, limit: 256

      t.column  :team_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT', limit: 8, null: false
      t.string  :team_name, limit: 256, null: false
      t.string  :team_overview, limit: 256

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
