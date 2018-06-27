class CreateTrnKadaiKanris < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_kadai_kanris do |t|
			t.integer :pj_id ,null:false
			t.integer :hojn_id ,null:false
			t.integer :menu_id ,null:false
			t.integer :kadai_s_id ,null:false
			t.string :kadai_title ,null:false,  :limit => 255
			t.string :kadai_psner ,null:false
			t.text :kadai_contents ,null:false
			t.string :kadai_person ,null:false
			t.datetime :kadai_limit ,null:false
			t.integer :kadai_phase ,null:false
			t.integer :kadai_impt ,null:false
			t.integer :kadai_status ,null:false
			t.integer :kadai_cgr ,null:false
			t.string :kadai_tenp
			t.text :kadai_try
			t.text :kadai_try2
			t.text :kadai_try3
			t.datetime :kadai_try_d
			t.datetime :kadai_try2_d
			t.datetime :kadai_try3_d
			t.string :kadai_try_w
			t.string :kadai_try2_w
			t.string :kadai_try3_w
			t.string :kadai_try_p
			t.string :kadai_try2_p
			t.string :kadai_try3_p
			t.string :kadai_cmt_psner
			t.text :kadai_cmt_ents
			t.string :kadai_cmt_notifier
			t.datetime :kadai_inst_ymd
			t.datetime :kadai_updt_ymd
			t.datetime :kadai_del_ymd
			t.integer :kadai_del_flag, limit: 8, null: false
			t.string :kadai_updt_id, limit: 256
			t.string :kadai_updt_s_end, limit: 256
			t.string :kadai_updt_t_end, limit: 256
			t.boolean :kadai_kanryo
    end
  end
end
