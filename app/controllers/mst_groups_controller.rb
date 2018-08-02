class MstGroupsController < ApplicationController
    #一覧画面 表示のアクション
    def index
      signed_check

      #データの取得
      @groups = MstGroup
        .where(del_flg: "false")
        .paginate(page: params[:page], per_page: 10)
        .order('group_id desc')
     
      #No列の開始No
      @grid_no = 1
     
      #params[:page]がNullまたは空ではない場合
      if params[:page].present?
        #開始No = ページ × ページングサイズ
        @grid_no = (params[:page].to_i - 1) * 10 + 1
      end
     
    end

    #照会画面 表示のアクション
    def show
      #ログインチェック
      signed_check
      #idでTasksテーブルを取得
      @group = MstGroup.find(params[:id])
    
      #viewを表示（省略可）
      render "show"
    
    end

    #登録画面 表示のアクション
    def new
      #ログインチェック
      signed_check
      
      #groupテーブルのスキーマでモデル（ActiveRecord）を作成
      @group = MstGroup.new
     
      #viewを表示（省略可）#TODO：未ログイン時にURL直打ちでエラー発生中
      render "new"
     
    end

    #編集画面 表示のアクション
    def edit
      #ログインチェック
      signed_check
      
      #idでグループテーブルを取得
      @group = MstGroup.find(params[:id])
     
    end

    #登録画面 登録ボタン押下時のアクション
    def create
     
      #ログインチェック
      signed_check
      
      #POSTされた値を元にTasksテーブル登録用レコードを作成
      @group = MstGroup.new(group_params)
     
      #エラーチェック
      if @group.valid?
        #--------------
        #エラーがない場合
        #--------------
        #ログインユーザ情報の取得
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @group.inst_user_id = @user.user_id
        @group.hojn_id = @user.hojn_id
        @group.pj_id = @user.pj_id

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.current
        @group.inst_ymd = target
        @group.del_flg = false


        #更新（エラーチェックを行わない）
        @group.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "グループ名：#{@group.group_nm} （グループID：#{@group.group_id} ）を登録しました。"
     
        #一覧画面へリダイレクト
        redirect_to mst_groups_path
      else
        #--------------
        #エラー時
        #--------------
        #登録画面のviewを再表示
        render "new"
      end
     
    end

    #編集画面 更新ボタン押下時のアクション
    def update
     
      #ログインチェック
      signed_check
      
      #POSTされた値(id)からレコードを取得
      @group = MstGroup.find(params[:id])
     
      #レコードをPOSTされた値(入力値)で上書き
      @group.assign_attributes(group_params)
     
      #エラーチェック
      if @group.valid?
        #--------------
        #エラーがない場合
        #--------------
        #ログインユーザ情報の取得
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @group.updt_history_tanto = @user.user_id
        @group.updt_history = 'task_update'

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.current
        @group.updt_ymd = target
        @group.del_flg = false
     
        #更新（エラーチェックを行わない）
        @group.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "グループ名：#{@group.group_nm} （グループID：#{@group.group_id} ）編集しました。"
     
        #一覧画面へリダイレクト
        redirect_to mst_groups_path
      else
        #--------------
        #エラー時
        #--------------
        render "edit"
      end
    end

  #一覧画面 削除ボタン押下時のアクション
  def destroy

      #ログインチェック
      signed_check
 
    #idでGroupテーブルを取得
    @group = MstGroup.find(params[:id])
 
    #削除処理（delete文発行）
    #@group.destroy
    
    #削除処理（論理削除）
    @group.del_flg = true
    target = DateTime.current
    @group.updt_ymd = target
    @group.del_ymd = target

    #ログインユーザ情報の取得
    @user = MstUser.find(current_user.id)

    #↓とりあえずべた書き。ログインユーザの情報を取得
    @group.updt_history_tanto = @user.user_id
    @group.updt_history = 'task_delete'
    
    #更新（エラーチェックを行わない）
    @group.save(validate:false)

 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "グループ名：#{@group.group_nm} （グループID：#{@group.group_id} ）削除しました。"
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
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
    def group_params
      params.require(:mst_group).permit(
        :pj_id,
        :group_nm,
        :account_edit_flg,
        :pj_mg_edit_flg,
        :top_msg_edit_flg,
        :com_mg_edit_flg,
        :progress_mg_edit_flg,
        :trq_mg_approval_flg,
        :trq_mg_edit_flg,
        :budget_mg_approval_flg,
        :budget_mg_edit_flg,
        :talent_mg_approval_flg,
        :talent_mg_edit_flg
      )
    end
end
