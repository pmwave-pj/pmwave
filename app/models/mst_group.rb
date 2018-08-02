class MstGroup < ApplicationRecord
   validate :check_group_nm

  private
 
  #group_nmのバリデーション
  def check_group_nm
    if !group_nm.present?
      errors.add("グループ名","を入力してください")
    elsif group_nm.length > 20
      errors.add("グループ名","は20文字以内で入力してください")
    end
  end
end
