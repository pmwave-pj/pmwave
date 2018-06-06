class TrnTaskDetail < ApplicationRecord
 
  #期限のアクセサー（画面入力用）
  attr_accessor :end_ymd
  
  #kanryo（文字列）の値がある場合、絞り込みを行う
  scope :by_kanryo, ->(kanryo){
    if kanryo.present?
      #bool型の変数
      kanryo_bool = true
      if kanryo == "true"
        kanryo_bool = true
      else
        kanryo_bool = false
      end
      where('kanryo = ?', kanryo_bool)
    end
  }
 
   validate :check_task_title
   validate :check_task_detail
   validate :check_end_ymd
 
  private
 
  #nameのバリデーション
  def check_task_title
    if !task_title.present?
      errors.add("タスク","を入力してください")
    elsif task_title.length > 20
      errors.add("タスク","は20文字以内で入力してください")
    end
  end
 
  #shosaiのバリデーション
  def check_task_detail
    if task_detail.present? && task_detail.length > 100
      errors.add("タスク詳細","は100文字以内で入力してください")
    end
  end
 
  #kigen_strのバリデーション
  def check_end_ymd
    if end_ymd.present? && !is_yyyymmdd?(end_ymd)
      errors.add("期限","のフォーマットが不正です")
    end
  end
 
  #文字列がyyyyMMdd型であるか
  def is_yyyymmdd?(yyyymmdd)
    if !yyyymmdd.present?
      return false
    end
    if yyyymmdd.length != 8
      return false
    end
    if !(yyyymmdd =~ /^[0-9]+$/)
      return false
    end
 
    result = true
    begin
      yyyy = yyyymmdd[0..3].to_i
      mm = yyyymmdd[4..5].to_i
      dd = yyyymmdd[6..7].to_i
      Date.new(yyyy,mm,dd)
    rescue
      result = false
    end
    result
  end
end