class MstUser < ApplicationRecord
  before_save { user_cd.downcase! }

  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

   validate :check_user_nm
   validate :check_user_cd
   validate :check_password
   validate :check_hojn_id
   validate :check_pj_id
   validate :check_timezone
   validate :check_region
   validate :check_language

  private

  #user_nmのバリデーション
  def check_user_nm
    if !user_nm.present?
      errors.add("名前","は必須項目です")
    elsif user_nm.length > 20
      errors.add("名前","は20文字以内で入力してください")
    end
  end

  #user_cdのバリデーション
  def check_user_cd
    if !user_cd.present?
      errors.add("メールアドレス","は必須項目です")
    end
  end

  #user_nmのバリデーション
  def check_password
    if !password.present?
      errors.add("パスワード","は必須項目です")
    elsif password.present? && password.length < 8
      errors.add("パスワード","は8文字以上で入力してください")
    elsif !password_confirmation.present?
      errors.add("パスワード確認","が未入力です")
#    elsif password.present? && password_confirmation.present? && password == password_confirmation
#      errors.add("確認用パスワード","が一致していません")
    end
  end

  #pj_idのバリデーション
  def check_pj_id
    if !pj_id.present?
      errors.add("PJID","は必須項目です")
    end
  end

  #hojn_idのバリデーション
  def check_hojn_id
    if !hojn_id.present?
      errors.add("法人コード","は必須項目です")
    end
  end

  #timezoneのバリデーション
  def check_timezone
    if !timezone.present?
      errors.add("タイムゾーン","は必須項目です（数値入力）")
    end
  end

  #regionのバリデーション
  def check_region
    if !region.present?
      errors.add("地域","は必須項目です（数値入力）")
    end
  end

  #languageのバリデーション
  def check_language
    if !language.present?
      errors.add("言語","は必須項目です（数値入力）")
    end
  end

end