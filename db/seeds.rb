# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TrnTaskDetail.delete_all
 
target = Date.today

TrnTaskDetail.create!(
  step_ownership_flg:false,
  task_title:"test",
  relation_step_id:1, 
  tanto_user_id:1111,
  relation_kadai_id:111,
  progress_rate:50,
  kaishiyotei_ymd:target,
  syuryouyotei_ymd:target+2,
  start_ymd:target,
  end_ymd:target,
  task_detail:"テストの詳細",
  topics:"テストのトピックス",
  pm_comment:"テストのPMコメント",
  inst_user_id:11,
  inst_ymd:target,
  updt_ymd:target,
  del_ymd:target,
  del_flg:false,
  updt_pgm_id:1234,
  updt_history:"test_insert",
  updt_history_tanto:"ruby_test_tanto"
)
TrnTaskDetail.create!(
  step_ownership_flg:false,
  task_title:"test",
  relation_step_id:1, 
  tanto_user_id:1111,
  relation_kadai_id:111,
  progress_rate:50,
  kaishiyotei_ymd:target,
  syuryouyotei_ymd:target+2,
  start_ymd:target,
  end_ymd:target,
  task_detail:"テストの詳細",
  topics:"テストのトピックス",
  pm_comment:"テストのPMコメント",
  inst_user_id:11,
  inst_ymd:target,
  updt_ymd:target,
  del_ymd:target,
  del_flg:false,
  updt_pgm_id:1234,
  updt_history:"test_insert",
  updt_history_tanto:"ruby_test_tanto"
)