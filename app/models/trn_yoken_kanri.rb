class TrnYokenKanri < ApplicationRecord
  
  has_many :phaseitem
  accepts_nested_attributes_for :phaseitem
  
  #期限のアクセサー（画面入力用）
  attr_accessor :yoken_limit_str
  attr_accessor :yoken_try_d_str
  attr_accessor :yoken_try2_d_str
  attr_accessor :yoken_try3_d_str
  attr_accessor :yoken_inst_ymd_str
  attr_accessor :yoken_updt_ymd_str
  attr_accessor :yoken_del_ymd_str
  attr_accessor :yoken_updt_s_end_str
  attr_accessor :yoken_updt_t_end_str

  scope :by_yoken_kanryo, ->(yoken_kanryo){
    if yoken_kanryo.present?
      #bool型の変数
      yoken_kanryo_bool = true
      if yoken_kanryo == "true"
        yoken_kanryo_bool = true
      else
        yoken_kanryo_bool = false
      end
      where('yoken_kanryo = ?', yoken_kanryo_bool)
    end
  }
  #===登録画面の作成②で追加 ここから===
  validate :check_yoken_title
  validate :check_yoken_contents
  validate :check_yoken_limit_str
  validate :check_yoken_try_d_str
  validate :check_yoken_try2_d_str
  validate :check_yoken_try3_d_str
  validate :check_yoken_inst_ymd_str
  validate :check_yoken_updt_ymd_str
  validate :check_yoken_del_ymd_str
  validate :check_yoken_updt_s_end_str
  validate :check_yoken_updt_t_end_str
  private
 
  #yoken_titleのバリデーション
  def check_yoken_title
    if !yoken_title.present?
      errors.add("タイトル","を入力してください")
    elsif yoken_title.length > 100
      errors.add("タイトル","は100文字以内で入力してください")
    end
  end
 
  #yoken_contentsのバリデーション
  def check_yoken_contents
    if !yoken_contents.present?
       errors.add("内容","を入力してください")
    elsif yoken_contents.length > 1000
      errors.add("内容","は1000文字以内で入力してください")
    end
  end
 
  #yoken_limit_strのバリデーション
  def check_yoken_limit_str
    if yoken_limit_str.present? && !is_yyyymmdd?(yoken_limit_str)
      errors.add("回答期限","のフォーマットが不正です")
    end
  end

  #yoken_try_d_strのバリデーション
  def check_yoken_try_d_str
    if yoken_try_d_str.present? && !is_yyyymmdd?(yoken_try_d_str)
      errors.add("対応期日","のフォーマットが不正です")
    end
  end

  #yoken_try2_d_strのバリデーション
  def check_yoken_try2_d_str
    if yoken_try2_d_str.present? && !is_yyyymmdd?(yoken_try2_d_str)
      errors.add("暫定対応期日","のフォーマットが不正です")
    end
  end

  #yoken_try3_d_strのバリデーション
  def check_yoken_try3_d_str
    if yoken_try3_d_str.present? && !is_yyyymmdd?(yoken_try3_d_str)
      errors.add("恒久対応期日","のフォーマットが不正です")
    end
  end

  #yoken_inst_ymd_strのバリデーション
  def check_yoken_inst_ymd_str
    if yoken_inst_ymd_str.present? && !is_yyyymmdd?(yoken_inst_ymd_str)
      errors.add("登録年月日","のフォーマットが不正です")
    end
  end

  #yoken_updt_ymd_strのバリデーション
  def check_yoken_updt_ymd_str
    if yoken_updt_ymd_str.present? && !is_yyyymmdd?(yoken_updt_ymd_str)
      errors.add("更新年月日","のフォーマットが不正です")
    end
  end

  #yoken_del_ymd_strのバリデーション
  def check_yoken_del_ymd_str
    if yoken_del_ymd_str.present? && !is_yyyymmdd?(yoken_del_ymd_str)
      errors.add("削除年月日","のフォーマットが不正です")
    end
  end
  
  #yoken_updt_s_end_strのバリデーション
  def check_yoken_updt_s_end_str
    if yoken_updt_s_end_str.present? && !is_yyyymmdd?(yoken_updt_s_end_str)
      errors.add("システム更新最終履歴","のフォーマットが不正です")
    end
  end

  #yoken_updt_t_end_strのバリデーション
  def check_yoken_updt_t_end_str
    if yoken_updt_t_end_str.present? && !is_yyyymmdd?(yoken_updt_t_end_str)
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