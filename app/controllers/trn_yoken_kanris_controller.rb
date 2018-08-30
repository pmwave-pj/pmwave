class TrnYokenKanrisController < ApplicationController
      #一覧画面 表示のアクション

def index
 
  #データの取得
  @trn_yoken_kanris = TrnYokenKanri
    .by_yoken_kanryo(params[:yoken_kanryo])
    .paginate(page: params[:page], per_page: 10)
    .order('yoken_kanryo asc, yoken_limit asc')
  
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

  #idで=TrnYokenKanrisテーブルを取得
  @trn_yoken_kanri = TrnYokenKanri.find(params[:id])
  
  #viewを表示（省略可）
  render "show"

end

 #登録画面 表示のアクション
def new
 
  #TrnYokenKanrisテーブルのスキーマでモデル（ActiveRecord）を作成
  @trn_yoken_kanri = TrnYokenKanri.new
  @phaseitems = Phaseitem.all

  #viewを表示（省略可）
  render "new"
 
end

#編集画面 表示のアクション
def edit
 
  #idでタスクテーブルを取得
  @trn_yoken_kanri = TrnYokenKanri.find(params[:id])
 
  #期限に値がある場合、日付型から文字列へ変換
  if @trn_yoken_kanri.yoken_limit.present?
    @trn_yoken_kanri.yoken_limit_str = @trn_yoken_kanri.yoken_limit.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_try_d.present?
    @trn_yoken_kanri.yoken_try_d_str = @trn_yoken_kanri.yoken_try_d.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_try2_d.present?
    @trn_yoken_kanri.yoken_try2_d_str = @trn_yoken_kanri.yoken_try2_d.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_try3_d.present?
    @trn_yoken_kanri.yoken_try3_d_str = @trn_yoken_kanri.yoken_try3_d.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_inst_ymd.present?
    @trn_yoken_kanri.yoken_inst_ymd_str = @trn_yoken_kanri.yoken_inst_ymd.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_updt_ymd.present?
    @trn_yoken_kanri.yoken_updt_ymd_str = @trn_yoken_kanri.yoken_updt_ymd.strftime("%Y%m%d")
  end
  if @trn_yoken_kanri.yoken_del_ymd.present?
    @trn_yoken_kanri.yoken_del_ymd_str = @trn_yoken_kanri.yoken_del_ymd.strftime("%Y%m%d")
  end
  #if @trn_yoken_kanri.yoken_updt_s_end.present?
  #  @trn_yoken_kanri.yoken_updt_s_end_str = @trn_yoken_kanri.yoken_updt_s_end.strftime("%Y%m%d")
  #end  
  #if @trn_yoken_kanri.yoken_updt_t_end.present?
  #  @trn_yoken_kanri.yoken_updt_t_end_str = @trn_yoken_kanri.yoken_updt_t_end.strftime("%Y%m%d")
  #end
end

#登録画面 登録ボタン押下時のアクション
def create
 
  #POSTされた値を元にTrnYokenKanrisテーブル登録用レコードを作成
  @trn_yoken_kanri = TrnYokenKanri.new(trn_yoken_kanri_params)

  #エラーチェック
  if @trn_yoken_kanri.valid?
    #--------------
    #エラーがない場合
    #--------------
    if @trn_yoken_kanri.yoken_limit_str.present?
      @trn_yoken_kanri.yoken_limit = Date.new(
        @trn_yoken_kanri.yoken_limit_str[0..3].to_i,
        @trn_yoken_kanri.yoken_limit_str[4..5].to_i,
        @trn_yoken_kanri.yoken_limit_str[6..7].to_i)
    end
    if @trn_yoken_kanri.yoken_try_d_str.present?
      @trn_yoken_kanri.yoken_try_d = Date.new(
        @trn_yoken_kanri.yoken_try_d_str[0..3].to_i,
        @trn_yoken_kanri.yoken_try_d_str[4..5].to_i,
        @trn_yoken_kanri.yoken_try_d_str[6..7].to_i)
    end
    if @trn_yoken_kanri.yoken_try2_d_str.present?
      @trn_yoken_kanri.yoken_try2_d = Date.new(
        @trn_yoken_kanri.yoken_try2_d_str[0..3].to_i,
        @trn_yoken_kanri.yoken_try2_d_str[4..5].to_i,
        @trn_yoken_kanri.yoken_try2_d_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_try3_d_str.present?
      @trn_yoken_kanri.yoken_try3_d = Date.new(
        @trn_yoken_kanri.yoken_try3_d_str[0..3].to_i,
        @trn_yoken_kanri.yoken_try3_d_str[4..5].to_i,
        @trn_yoken_kanri.yoken_try3_d_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_inst_ymd_str.present?
      @trn_yoken_kanri.yoken_inst_ymd = Date.new(
        @trn_yoken_kanri.yoken_inst_ymd_str[0..3].to_i,
        @trn_yoken_kanri.yoken_inst_ymd_str[4..5].to_i,
        @trn_yoken_kanri.yoken_inst_ymd_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_updt_ymd_str.present?
      @trn_yoken_kanri.yoken_updt_ymd = Date.new(
        @trn_yoken_kanri.yoken_updt_ymd_str[0..3].to_i,
        @trn_yoken_kanri.yoken_updt_ymd_str[4..5].to_i,
        @trn_yoken_kanri.yoken_updt_ymd_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_del_ymd_str.present?
      @trn_yoken_kanri.yoken_del_ymd = Date.new(
        @trn_yoken_kanri.yoken_del_ymd_str[0..3].to_i,
        @trn_yoken_kanri.yoken_del_ymd_str[4..5].to_i,
        @trn_yoken_kanri.yoken_del_ymd_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_updt_s_end_str.present?
      @trn_yoken_kanri.yoken_updt_s_end = Date.new(
        @trn_yoken_kanri.yoken_updt_s_end_str[0..3].to_i,
        @trn_yoken_kanri.yoken_updt_s_end_str[4..5].to_i,
        @trn_yoken_kanri.yoken_updt_s_end_str[6..7].to_i)
    end 
    if @trn_yoken_kanri.yoken_updt_t_end_str.present?
      @trn_yoken_kanri.yoken_updt_t_end = Date.new(
        @trn_yoken_kanri.yoken_updt_t_end_str[0..3].to_i,
        @trn_yoken_kanri.yoken_updt_t_end_str[4..5].to_i,
        @trn_yoken_kanri.yoken_updt_t_end_str[6..7].to_i)
    end 
    
    
    
    
    
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @trn_yoken_kanri.yoken_kanryo == true
          else
           @trn_yoken_kanri.yoken_kanryo = false
        end
        #親工程フラグをセットする。未入力の場合でもfalseでセットする
        #if @task.step_ownership_flg == true
        #else
        # @task.step_ownership_flg = false
        #end
        #ここの記述は大丈夫そう
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @trn_yoken_kanri.pj_id = @user.pj_id
        @trn_yoken_kanri.hojn_id = @user.hojn_id
        @trn_yoken_kanri.yoken_psner = @user.user_id

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @trn_yoken_kanri.yoken_limit = target
        @trn_yoken_kanri.yoken_del_flag = false
 
#更新（エラーチェックを行わない）
  @trn_yoken_kanri.save(validate:false)
  
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "登録しました。"
 
    #一覧画面へリダイレクト
    redirect_to trn_yoken_kanris_path
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
 
  #POSTされた値(id)からレコードを取得
  @trn_yoken_kanri = TrnYokenKanri.find(params[:id])
 
  #レコードをPOSTされた値(入力値)で上書き
  @trn_yoken_kanri.assign_attributes(trn_yoken_kanri_params)
 
  #エラーチェック
  if @trn_yoken_kanri.valid?
    #--------------
    #エラーがない場合
    #--------------
    if @trn_yoken_kanri.yoken_limit_str.present?
      @trn_yoken_kanri.yoken_limit = Date.new(
        @trn_yoken_kanri.yoken_limit_str[0..3].to_i,
        @trn_yoken_kanri.yoken_limit_str[4..5].to_i,
        @trn_yoken_kanri.yoken_limit_str[6..7].to_i)
    end
    
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @trn_yoken_kanri.yoken_kanryo == true
          else
           @trn_yoken_kanri.yoken_kanryo = false
        end
        #親工程フラグをセットする。未入力の場合でもfalseでセットする
        #if @task.step_ownership_flg == true
        #else
        # @task.step_ownership_flg = false
        #end

        #ここの記述は大丈夫そう
        #@user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        #@task.updt_history_tanto = @user.user_id
        #@task.updt_history = 'task_update'
        
        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @trn_yoken_kanri.yoken_limit = target
        @trn_yoken_kanri.yoken_try_d = target
        @trn_yoken_kanri.yoken_del_flag = false

 
    #更新（エラーチェックを行わない）
    @trn_yoken_kanri.save(validate:false)
 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "編集しました。"
 
    #一覧画面へリダイレクト
    redirect_to trn_yoken_kanris_path
  else
    #--------------
    #エラー時
    #--------------
    render "edit"
  end
end

    #一覧画面 削除ボタン押下時のアクション
  def destroy
 
    #idでTrnYokenKanrisテーブルを取得
    @trn_yoken_kanri = TrnYokenKanri.find(params[:id])
 
    #削除処理（delete文発行）
    @trn_yoken_kanri.destroy
 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "削除しました。"
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
  end
 
  #一覧画面 完了ボタン押下時のアクション
  def yoken_kanryo
 
    #idでTrnYokenKanrisテーブルを取得
    @trn_yoken_kanri = TrnyokenKanri.find(params[:id])
 
    #yoken_kanryoにtrueをセット
    @trn_yoken_kanri. yoken_kanryo = true
 
    #更新処理（update文発行）
    @trn_yoken_kanri.save
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
  end

#------------------------------------------------------------------------------
private
#------------------------------------------------------------------------------
 
#ストロングパラメータ（マスアサインメント脆弱性回避）
def trn_yoken_kanri_params
  params.require(:trn_yoken_kanri).permit(
    :pj_id,
    :hojn_id,
    :menu_id,
    :yoken_s_id,
    :yoken_title,
    :yoken_psner,
    :yoken_contents,
    :yoken_person,
    :yoken_limit_str,
    :yoken_merit,
    :yoken_impt,
    :yoken_status,
    :yoken_tenp,
    :yoken_try,
    :yoken_try2,
    :yoken_try3,
    :yoken_try_d_str,
    :yoken_try2_d_str,
    :yoken_try3_d_str,
    :yoken_try_w,
    :yoken_try2_w,
    :yoken_try3_w,
    :yoken_try_p,
    :yoken_try2_p,
    :yoken_try3_p,
    :yoken_cmt_psner,
    :yoken_cmt_ents,
    :yoken_cmt_notifier,
    :yoken_inst_ymd_str,
    :yoken_updt_ymd_str,
    :yoken_del_ymd_str,
    :yoken_del_flag,
    :yoken_updt_id,
    :yoken_updt_s_end_str,
    :yoken_updt_t_end_str,
    :yoken_kanryo
  )
end

before_action :set_phaseitems, only: [:new, :create, :edit, :update]

def set_phaseitems
  @phaseitems = Phaseitem.all
end

end