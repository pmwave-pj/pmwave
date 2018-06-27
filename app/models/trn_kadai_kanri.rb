class TrnKadaiKanri < ApplicationRecord
  
  #期限のアクセサー（画面入力用）
  attr_accessor :kadai_limit_str
  
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
end