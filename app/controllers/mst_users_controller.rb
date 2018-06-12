class MstUsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    #ログインチェック
    signed_check
    
    @users = MstUser.all
  end

  def show
    #ログインチェック
    signed_check
    @user = MstUser.find(params[:id])
  end

  def new
    #ログインチェック
    signed_check
    @user = MstUser.new
  end

  def edit
    #ログインチェック
    signed_check
  end

  def create
    
    #ログインチェック
    signed_check
    
    @user = MstUser.new(user_params)
        #↓とりあえずべた書き。本当はログインユーザの情報を取得したい
        @user.inst_user_id = 0
        #@user.hojn_id = 0
        #@user.pj_id = 0

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @user.inst_ymd = target
        @user.del_flg = false

    if @user.save
      #sign_in @user ←作成後、作成されたユーザでログインしたくないのでサンプルには記述があったが削除している。

      #フラッシュ（一度きりのセッション）にメッセージを格納
      flash[:msg] = "ユーザ作成が完了しました"
      #作成後はアカウント作成画面へ遷移
      redirect_to new_mst_user_path
    else
      flash[:msg] = "ユーザ作成に失敗しました。パスワードが未入力です。"
      render 'new'
    end
  end

  def update
    #ログインチェック
    signed_check
      
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def signed_check
   if signed_in?
    else
     redirect_to root_url
   end
  end

    #------------------------------------------------------------------------------
    private
    #------------------------------------------------------------------------------
     
    #ストロングパラメータ（マスアサインメント脆弱性回避）

    def user_params
      params.require(:mst_user).permit(
          :user_nm, 
          :user_cd, 
          :password, 
          :password_confirmation,
          :user_nm_kana,
          :pj_id, 
          :group_id, 
          :hojn_id, 
          :company_nm, 
          :department_nm, 
          :tel_1, 
          :tel_2, 
          :tel_3, 
          :birthday_ymd, 
          :entry_ymd, 
          :twitter_url, 
          :facebook_url, 
          :account1, 
          :account2, 
          :timezone, 
          :region, 
          :language, 
          :address_country, 
          :address_zip_code, 
          :address_prefectures, 
          :address_city, 
          :address_street, 
          :comment, 
          :notices, 
          :inst_user_id)
    end

    def correct_user
      @user = MstUser.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end