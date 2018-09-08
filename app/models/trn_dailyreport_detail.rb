class TrnDailyreportDetail < ApplicationRecord
  #期限のアクセサー（画面入力用）
  attr_accessor :create_ymd_str

   validate :check_create_ymd
 
  private
 
  #task_titleのバリデーション
  def check_create_ymd
    if !create_ymd_str.present?
      errors.add("作成日","を入力してください")
    elsif create_ymd_str.present? && !is_yyyymmdd?(create_ymd_str)
      errors.add("作成日","のフォーマットが不正です")
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
