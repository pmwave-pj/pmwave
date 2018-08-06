class TrnKadaiKanri < ApplicationRecord
  
  has_many :phaseitem
  accepts_nested_attributes_for :phaseitem
  
  #期限のアクセサー（画面入力用）
  attr_accessor :kadai_limit_str
  attr_accessor :kadai_try_d_str
  attr_accessor :kadai_try2_d_str
  attr_accessor :kadai_try3_d_str
  attr_accessor :kadai_inst_ymd_str
  attr_accessor :kadai_updt_ymd_str
  attr_accessor :kadai_del_ymd_str
  attr_accessor :kadai_updt_s_end_str
  attr_accessor :kadai_updt_t_end_str

  scope :by_kadai_kanryo, ->(kadai_kanryo){
    if kadai_kanryo.present?
      #bool型の変数
      kadai_kanryo_bool = true
      if kadai_kanryo == "true"
        kadai_kanryo_bool = true
      else
        kadai_kanryo_bool = false
      end
      where('kadai_kanryo = ?', kadai_kanryo_bool)
    end
  }
  #===登録画面の作成②で追加 ここから===
  validate :check_kadai_title
  validate :check_kadai_contents
  validate :check_kadai_limit_str
  validate :check_kadai_try_d_str
  validate :check_kadai_try2_d_str
  validate :check_kadai_try3_d_str
  validate :check_kadai_inst_ymd_str
  validate :check_kadai_updt_ymd_str
  validate :check_kadai_del_ymd_str
  validate :check_kadai_updt_s_end_str
  validate :check_kadai_updt_t_end_str
  private
 
  #kadai_titleのバリデーション
  def check_kadai_title
    if !kadai_title.present?
      errors.add("タイトル","を入力してください")
    elsif kadai_title.length > 100
      errors.add("タイトル","は100文字以内で入力してください")
    end
  end
 
  #kadai_contentsのバリデーション
  def check_kadai_contents
    if !kadai_contents.present?
       errors.add("内容","を入力してください")
    elsif kadai_contents.length > 1000
      errors.add("内容","は1000文字以内で入力してください")
    end
  end
 
  #kadai_limit_strのバリデーション
  def check_kadai_limit_str
    if kadai_limit_str.present? && !is_yyyymmdd?(kadai_limit_str)
      errors.add("回答期限","のフォーマットが不正です")
    end
  end

  #kadai_try_d_strのバリデーション
  def check_kadai_try_d_str
    if kadai_try_d_str.present? && !is_yyyymmdd?(kadai_try_d_str)
      errors.add("対応期日","のフォーマットが不正です")
    end
  end

  #kadai_try2_d_strのバリデーション
  def check_kadai_try2_d_str
    if kadai_try2_d_str.present? && !is_yyyymmdd?(kadai_try2_d_str)
      errors.add("暫定対応期日","のフォーマットが不正です")
    end
  end

  #kadai_try3_d_strのバリデーション
  def check_kadai_try3_d_str
    if kadai_try3_d_str.present? && !is_yyyymmdd?(kadai_try3_d_str)
      errors.add("恒久対応期日","のフォーマットが不正です")
    end
  end

  #kadai_inst_ymd_strのバリデーション
  def check_kadai_inst_ymd_str
    if kadai_inst_ymd_str.present? && !is_yyyymmdd?(kadai_inst_ymd_str)
      errors.add("登録年月日","のフォーマットが不正です")
    end
  end

  #kadai_updt_ymd_strのバリデーション
  def check_kadai_updt_ymd_str
    if kadai_updt_ymd_str.present? && !is_yyyymmdd?(kadai_updt_ymd_str)
      errors.add("更新年月日","のフォーマットが不正です")
    end
  end

  #kadai_del_ymd_strのバリデーション
  def check_kadai_del_ymd_str
    if kadai_del_ymd_str.present? && !is_yyyymmdd?(kadai_del_ymd_str)
      errors.add("削除年月日","のフォーマットが不正です")
    end
  end
  
  #kadai_updt_s_end_strのバリデーション
  def check_kadai_updt_s_end_str
    if kadai_updt_s_end_str.present? && !is_yyyymmdd?(kadai_updt_s_end_str)
      errors.add("システム更新最終履歴","のフォーマットが不正です")
    end
  end

  #kadai_updt_t_end_strのバリデーション
  def check_kadai_updt_t_end_str
    if kadai_updt_t_end_str.present? && !is_yyyymmdd?(kadai_updt_t_end_str)
      errors.add("担当者更新最終履歴","のフォーマットが不正です")
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
  #===登録画面の作成②で追加 ここまで===

  SELECT_OPTIONS = [
        ['概要検討',   '概要検討'],
        ['要件定義', '要件定義'],
        ['設計',    '設計'],
        ['開発',   '開発'],
        ['単結テスト',    '単結テスト'],
        ['システムテスト', 'システムテスト'],
        ['総合テスト  ',    '総合テスト'],
        ['リリース',   'リリース']
      ]
      
end