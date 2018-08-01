class MstUsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    #ログインチェック
    signed_check
    
    @users = MstUser
        .where(del_flg: "false")
        .paginate(page: params[:page], per_page: 10)

    
     #No列の開始No
      @grid_no = 1
     
      #params[:page]がNullまたは空ではない場合
      if params[:page].present?
        #開始No = ページ × ページングサイズ
        @grid_no = (params[:page].to_i - 1) * 10 + 1
      end
     
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
    @current_user = MstUser.find(current_user.id)

    #エラーチェック
    if @user.valid?
    #--------------
    #エラーがない場合
    #--------------

       #登録者のユーザID
       @user.inst_user_id = @current_user.id

       #↓とりあえずべた書き。本当はマスタ管理し、選択出来るようにしたい
       @user.hojn_id = 0
       @user.pj_id = 0
       @user.timezone = 0
       @user.region = 0
       @user.language = 0

       #現在時刻を取得する。
       target = DateTime.now
       @user.inst_ymd = target
       @user.del_flg = false

        #更新（エラーチェックを行わない）
        @user.save(validate:false)
        #sign_in @user ←作成後、作成されたユーザでログインしたくないのでサンプルには記述があったが削除している。
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "ユーザ作成が完了しました"
        #作成後はアカウント作成画面へ遷移
        redirect_to new_mst_user_path
    else
        #--------------
        #エラー時
        #--------------
        #登録画面のviewを再表示
        flash[:msg] = "ユーザ作成に失敗しました。"
        render 'new'
    end
  end

  def update

    #ログインチェック
    signed_check

    @user = MstUser.find(params[:id])
    @current_user = MstUser.find(current_user.id)

    #レコードをPOSTされた値(入力値)で上書き
    @user.assign_attributes(user_params)

    #エラーチェック
    if @user.valid?
    #--------------
    #エラーがない場合
    #--------------

       #ログインユーザの情報を取得し登録
       @user.updt_history_tanto = @current_user.id
       @user.updt_history = 'user_update'

       #とりあえずべた書き。現在時刻を取得する
       target = DateTime.now
       @user.updt_ymd = target
       @user.del_flg = false

       #更新（エラーチェックを行わない）
       @user.save(validate:false)
       #sign_in @user ←作成後、作成されたユーザでログインしたくないのでサンプルには記述があったが削除している。
       #フラッシュ（一度きりのセッション）にメッセージを格納
       flash[:msg] = "ユーザ情報の編集が完了しました"
       #作成後はアカウント参照画面へ遷移
       redirect_to @user
    else
        #--------------
        #エラー時
        #--------------
        #登録画面のviewを再表示
        #flash[:msg] = "ユーザ作成に失敗しました。"
      render 'edit'
    end
  end

  def signed_check
   if signed_in?
    else
     redirect_to root_url
   end
  end

  #一覧画面 削除ボタン押下時のアクション
  def destroy

      #ログインチェック
      signed_check
 
    #idでMstUsersテーブルを取得
    @user = MstUser.find(params[:id])
 
    #削除処理（delete文発行）
    #@task.destroy
    
    @current_user = MstUser.find(current_user.id)

    #削除処理（論理削除）
    @user.remember_token = 'Null'
    @user.del_flg = true
    target = DateTime.now
    @user.updt_ymd = target
    @user.del_ymd = target
    @user.updt_history_tanto = @current_user.id
    @user.updt_history = 'user_delete'
    
    #更新（エラーチェックを行わない）
    @user.save(validate:false)

 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "削除しました。"
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
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