class TrnTaskDetail < ApplicationRecord
 
  #期限のアクセサー（画面入力用）
  attr_accessor :end_ymd
  
  #kanryo（文字列）の値がある場合、絞り込みを行う
  scope :by_kanryo, ->(end_flg){
    if end_flg.present?
      #bool型の変数
      end_flg_bool = true
      if end_flg == "true"
        end_flg_bool = true
      else
        end_flg_bool = false
      end
      where('end_flg = ?', end_flg_bool)
    end
  }
 
   validate :check_task_title
   validate :check_task_detail
   validate :check_kaishiyotei_ymd
   validate :check_syuryouyotei_ymd
   validate :check_start_ymd
   validate :check_end_ymd

 
  private
 
  #task_titleのバリデーション
  def check_task_title
    if !task_title.present?
      errors.add("タスク","を入力してください")
    elsif task_title.length > 20
      errors.add("タスク","は20文字以内で入力してください")
    end
  end
 
  #task_detailのバリデーション
  def check_task_detail
    if task_detail.present? && task_detail.length > 1000
      errors.add("タスク詳細","は1000文字以内で入力してください")
    end
  end
 
  #kaishiyotei_ymdのバリデーション
  def check_kaishiyotei_ymd
    if end_ymd.present? && !is_yyyymmdd?(kaishiyotei_ymd)
      errors.add("開始予定日","のフォーマットが不正です")
    end
  end

  #syuryouyotei_ymdのバリデーション
  def check_syuryouyotei_ymd
    if end_ymd.present? && !is_yyyymmdd?(syuryouyotei_ymd)
      errors.add("終了予定日","のフォーマットが不正です")
    end
  end

  #start_ymdのバリデーション
  def check_start_ymd
    if end_ymd.present? && !is_yyyymmdd?(start_ymd)
      errors.add("作業開始日","のフォーマットが不正です")
    end
  end

  #end_ymdのバリデーション
  def check_end_ymd
    if end_ymd.present? && !is_yyyymmdd?(end_ymd)
      errors.add("作業完了日","のフォーマットが不正です")
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