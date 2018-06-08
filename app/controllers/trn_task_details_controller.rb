class TrnTaskDetailsController < ApplicationController

    #一覧画面 表示のアクション
    def index
      signed_check

      #データの取得
      @tasks = TrnTaskDetail
        .by_kanryo(params[:end_flg])
        .where(del_flg: "false")
        .paginate(page: params[:page], per_page: 10)
        .order('end_flg asc, end_ymd asc')
     
      #No列の開始No
      @grid_no = 1
     
      #params[:page]がNullまたは空ではない場合
      if params[:page].present?
        #開始No = ページ × ページングサイズ
        @grid_no = (params[:page].to_i - 1) * 5 + 1
      end
     
    end

    #照会画面 表示のアクション
    def show
      #ログインチェック
      signed_check
      #idでTasksテーブルを取得
      @task = TrnTaskDetail.find(params[:id])
    
      #viewを表示（省略可）
      render "show"
    
    end

    #登録画面 表示のアクション
    def new
      #ログインチェック
      signed_check
      
      #Tasksテーブルのスキーマでモデル（ActiveRecord）を作成
      @task = TrnTaskDetail.new
     
      #viewを表示（省略可）#TODO：未ログイン時にURL直打ちでエラー発生中
      render "new"
     
    end

    #編集画面 表示のアクション
    def edit
      #ログインチェック
      signed_check
      
      #idでタスクテーブルを取得
      @task = TrnTaskDetail.find(params[:id])
     
      #期限に値がある場合、日付型から文字列へ変換
      if @task.end_ymd.present?
        @task.end_ymd = @task.end_ymd.strftime("%Y%m%d")
      end
     
    end

    #登録画面 登録ボタン押下時のアクション
    def create
     
      #ログインチェック
      signed_check
      
      #POSTされた値を元にTasksテーブル登録用レコードを作成
      @task = TrnTaskDetail.new(task_params)
     
      #エラーチェック
      if @task.valid?
        #--------------
        #エラーがない場合
        #--------------
        if @task.end_ymd.present?
           @task.end_ymd = Date.new(
            @task.end_ymd[0..3].to_i,
            @task.end_ymd[4..5].to_i,
            @task.end_ymd[6..7].to_i)
        end
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @task.end_flg == true
          else
           @task.end_flg = false
        end
        #親工程フラグをセットする。未入力の場合でもfalseでセットする
        if @task.step_ownership_flg == true
          else
           @task.step_ownership_flg = false
        end
        #ここの記述は大丈夫そう @user = User.find(params[:id])
        #↓とりあえずべた書き。本当はログインユーザの情報を取得したい
        @task.inst_user_id = 0
        @task.hojn_id = 0
        @task.pj_id = 0

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @task.inst_ymd = target
        @task.del_flg = false


        #更新（エラーチェックを行わない）
        @task.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "登録しました。"
     
        #一覧画面へリダイレクト
        redirect_to trn_task_details_path
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
      @task = TrnTaskDetail.find(params[:id])
     
      #レコードをPOSTされた値(入力値)で上書き
      @task.assign_attributes(task_params)
     
      #エラーチェック
      if @task.valid?
        #--------------
        #エラーがない場合
        #--------------
        if @task.end_ymd.present?
           @task.end_ymd = Date.new(
            @task.end_ymd[0..3].to_i,
            @task.end_ymd[4..5].to_i,
            @task.end_ymd[6..7].to_i)
        end
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @task.end_flg == true
          else
           @task.end_flg = false
        end
        #親工程フラグをセットする。未入力の場合でもfalseでセットする
        if @task.step_ownership_flg == true
          else
           @task.step_ownership_flg = false
        end
        #ここの記述は大丈夫そう @user = User.find(params[:id])
        #↓とりあえずべた書き。本当はログインユーザの情報を取得したい
        @task.updt_history_tanto = 0
        #@task.hojn_id = 0
        #@task.pj_id = 0

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @task.updt_ymd = target
        @task.del_flg = false


     
        #更新（エラーチェックを行わない）
        @task.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "編集しました。"
     
        #一覧画面へリダイレクト
        redirect_to trn_task_details_path
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
 
    #idでTasksテーブルを取得
    @task = TrnTaskDetail.find(params[:id])
 
    #削除処理（delete文発行）
    #@task.destroy
    
    #削除処理（論理削除）
    @task.del_flg = true
    target = DateTime.now
    @task.updt_ymd = target
    @task.del_ymd = target
    @task.updt_history_tanto = 0
    
    #更新（エラーチェックを行わない）
    @task.save(validate:false)

 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "削除しました。"
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
  end
 
  #一覧画面 完了ボタン押下時のアクション
  def kanryo
 
      #ログインチェック
      signed_check
      
    #idでTasksテーブルを取得
    @task = TrnTaskDetail.find(params[:id])

    #kanryoにtrueをセット
    @task.end_flg = true
 
    #更新処理（update文発行）
    @task.save
 
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
    def task_params
      params.require(:trn_task_detail).permit(
        :task_title,
        :task_detail,
        :end_ymd,
        :tanto_user_id, 
        :relation_step_id, 
        :step_ownership_flg, 
        :progress_rate, 
        :kaishiyotei_ymd, 
        :syuryouyotei_ymd, 
        :start_ymd, 
        :end_flg,
        :inst_user_id,
        :hojn_id,
        :pj_id,
        :inst_ymd
      )
    end
end