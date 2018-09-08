module TrnDailyreportDetailsHelper

    #一覧画面 表示のアクション
    def index
      signed_check

      #データの取得
      @reports = TrnDailyreportDetail
        .where(del_flg: "false")
        .paginate(page: params[:page], per_page: 100)

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
      #idでreportテーブルを取得
        @report = TrnDailyreportDetail.find(params[:id])
    
      #viewを表示（省略可）
      render "show"
    
    end

    #登録画面 表示のアクション
    def new
      #ログインチェック
      signed_check
      
      #reportテーブルのスキーマでモデル（ActiveRecord）を作成
      @report = TrnDailyreportDetail.new
     
      #viewを表示（省略可）#TODO：未ログイン時にURL直打ちでエラー発生中
      render "new"
     
    end

    #編集画面 表示のアクション
    def edit
      #ログインチェック
      signed_check
      
      #idでreportテーブルを取得
      @report = TrnDailyreportDetail.find(params[:id])
     
      #期限に値がある場合、日付型から文字列へ変換
      if @report.inst_ymd.present?
        @report.inst_ymd_str = @report.inst_ymd.strftime("%Y%m%d")
      end
     
    end

    #登録画面 登録ボタン押下時のアクション
    def create
     
      #ログインチェック
      signed_check
      
      #POSTされた値を元にTasksテーブル登録用レコードを作成
      @report = TrnDailyreportDetail.new(report_params)
     
      #エラーチェック
      if @report.valid?
        #--------------
        #エラーがない場合
        #--------------
        if @report.inst_ymd_str.present?
           @task.inst_ymd = Date.new(
            @report.inst_ymd_str[0..3].to_i,
            @report.inst_ymd_str[4..5].to_i,
            @report.inst_ymd_str[6..7].to_i)
        end
        
        #ログインユーザ情報の取得
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @report.inst_user_id = @user.user_id
        @report.hojn_id = @user.hojn_id
        @report.pj_id = @user.pj_id

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.current
        @report.inst_ymd = target
        @report.del_flg = false


        #更新（エラーチェックを行わない）
        @report.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "日報：#{@report.dailyreport_id}　を登録しました。"
     
        #一覧画面へリダイレクト
        redirect_to trn_dailyreport_details_path
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
      @report = TrnDailyreportDetail.find(params[:id])
     
      #レコードをPOSTされた値(入力値)で上書き
      @report.assign_attributes(report_params)
     
      #エラーチェック
      if @report.valid?
        #--------------
        #エラーがない場合
        #--------------
        if @report.inst_ymd_str.present?
           @task.inst_ymd = Date.new(
            @report.inst_ymd_str[0..3].to_i,
            @report.inst_ymd_str[4..5].to_i,
            @report.inst_ymd_str[6..7].to_i)
        end

        #ログインユーザ情報の取得
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @report.updt_history_tanto = @user.user_id
        @report.updt_history = 'report_update'

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.current
        @report.updt_ymd = target
        @report.del_flg = false
     
        #更新（エラーチェックを行わない）
        @report.save(validate:false)
     
        #フラッシュ（一度きりのセッション）にメッセージを格納
        flash[:msg] = "日報：#{@report.dailyreport_id}　を編集しました。"
     
        #一覧画面へリダイレクト
        redirect_to trn_dailyreport_details_path
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
 
    #idでreportテーブルを取得
    @report = TrnDailyreportDetail.find(params[:id])
 
    #削除処理（delete文発行）
    #@task.destroy
    
    #削除処理（論理削除）
    @report.del_flg = true
    target = DateTime.current
    @report.updt_ymd = target
    @report.del_ymd = target

    #ログインユーザ情報の取得
    @user = MstUser.find(current_user.id)

    #↓とりあえずべた書き。ログインユーザの情報を取得
    @report.updt_history_tanto = @user.user_id
    @report.updt_history = 'report_delete'
    
    #更新（エラーチェックを行わない）
    @report.save(validate:false)

 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "日報：#{@report.dailyreport_id}　を削除しました。"
 
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
    def report_params
      params.require(:trn_dailyreport_detail).permit(
        :dailyreport_id,
        :work_plan_today,
        :work_result,
        :work_verification,
        :work_plan_tomorrow,
        :work_impression,
        :end_flg,
        :inst_user_id,
        :hojn_id,
        :pj_id,
        :inst_ymd
      )
    end
end
