class CreateTrnYokenKanris < ActiveRecord::Migration[5.2]
  def change
    create_table :trn_yoken_kanris do |t|
            t.integer :pj_id , 'INTEGER PRIMARY KEY AUTO_INCREMENT'
            t.integer :hojn_id ,null:false
            t.integer :menu_id
            t.integer :yoken_s_id
            t.string :yoken_title ,null:false,  :limit => 255
            t.string :yoken_psner ,null:false
            t.text :yoken_contents ,null:false
            t.string :yoken_person ,null:false
            t.datetime :yoken_limit ,null:false
            t.text :yoken_merit ,null:false
            t.integer :yoken_impt ,null:false
            t.integer :yoken_status ,null:false
            t.string :yoken_tenp
            t.text :yoken_try
            t.text :yoken_try2
            t.text :yoken_try3
            t.datetime :yoken_try_d
            t.datetime :yoken_try2_d
            t.datetime :yoken_try3_d
            t.string :yoken_try_w
            t.string :yoken_try2_w
            t.string :yoken_try3_w
            t.string :yoken_try_p
            t.string :yoken_try2_p
            t.string :yoken_try3_p
            t.string :yoken_cmt_psner
            t.text :yoken_cmt_ents
            t.string :yoken_cmt_notifier
            t.datetime :yoken_inst_ymd
            t.datetime :yoken_updt_ymd
            t.datetime :yoken_del_ymd
            t.integer :yoken_del_flag, limit: 8
            t.string :yoken_updt_id, limit: 256
            t.string :yoken_updt_s_end, limit: 256
            t.string :yoken_updt_t_end, limit: 256
            t.boolean :yoken_kanryo
    end
  end
end
