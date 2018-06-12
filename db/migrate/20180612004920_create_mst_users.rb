class CreateMstUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_users,id: false do |t|
      t.column :user_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.string :user_cd, limit: 256, null: false
      t.string :password_digest, limit: 256, null: false
      t.string :remember_token, limit: 256
      t.string :user_nm, limit: 256, null: false
      t.string :user_nm_kana, limit: 256
      t.integer :group_id, limit: 4, null: false
      t.integer :hojn_id, limit: 4, null: false
      t.string :company_nm, limit: 256
      t.string :department_nm, limit: 256
      t.integer :pj_id, limit: 4, null: false
      t.integer :group_id, limit: 4
      t.string :tel_1, limit: 256
      t.string :tel_2, limit: 256
      t.string :tel_3, limit: 256
      t.datetime :birthday_ymd
      t.datetime :entry_ymd
      t.string :twitter_url, limit: 256
      t.string :facebook_url, limit: 256
      t.string :account1, limit: 256
      t.string :account2, limit: 256
      t.integer :timezone, limit: 4, null: false
      t.integer :region, limit: 4, null: false
      t.integer :language, limit: 4, null: false
      t.string :address_country, limit: 256
      t.string :address_zip_code, limit: 256
      t.string :address_prefectures, limit: 256
      t.string :address_city, limit: 256
      t.string :address_street, limit: 256
      t.string :comment, limit: 256
      t.text :notices
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
