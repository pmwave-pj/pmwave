class CreateMstKadaiPhases < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_kadai_phases do |t|
    t.integer :pj_id ,null:false
    t.integer :hojn_id ,null:false
    t.integer :menu_id ,null:false
    t.integer :kadai_phase_id ,null:false
    t.string :kadai_phase_name ,null:false
    t.datetime :kadai_inst_ymd ,null:false
    t.datetime :kadai_updt_ymd
    t.datetime :kadai_del_ymd
    t.integer :kadai_del_flag
    t.integer :kadai_updt_id
    t.datetime :kadai_updt_s_end
    t.datetime :kadai_updt_t_end
    end
  end
end
