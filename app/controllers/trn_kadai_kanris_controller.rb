class TrnKadaiKanrisController < ApplicationController
      #一覧画面 表示のアクション

def index
 
  #データの取得
  @trn_kadai_kanris = TrnKadaiKanri
    .by_kadai_kanryo(params[:kadai_kanryo])
    .paginate(page: params[:page], per_page: 10)
    .order('kadai_kanryo asc, kadai_limit asc')
  
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

  #idで=TrnKadaiKanrisテーブルを取得
  @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])
  
  #viewを表示（省略可）
  render "show"

end

 #登録画面 表示のアクション
def new
 
  #TrnKadaiKanrisテーブルのスキーマでモデル（ActiveRecord）を作成
  @trn_kadai_kanri = TrnKadaiKanri.new
  @phaseitems = Phaseitem.all

  #viewを表示（省略可）
  render "new"
 
end

#編集画面 表示のアクション
def edit
 
  #idでタスクテーブルを取得
  @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])
 
  #期限に値がある場合、日付型から文字列へ変換
  if @trn_kadai_kanri.kadai_limit.present?
    @trn_kadai_kanri.kadai_limit_str = @trn_kadai_kanri.kadai_limit.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_try_d.present?
    @trn_kadai_kanri.kadai_try_d_str = @trn_kadai_kanri.kadai_try_d.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_try2_d.present?
    @trn_kadai_kanri.kadai_try2_d_str = @trn_kadai_kanri.kadai_try2_d.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_try3_d.present?
    @trn_kadai_kanri.kadai_try3_d_str = @trn_kadai_kanri.kadai_try3_d.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_inst_ymd.present?
    @trn_kadai_kanri.kadai_inst_ymd_str = @trn_kadai_kanri.kadai_inst_ymd.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_updt_ymd.present?
    @trn_kadai_kanri.kadai_updt_ymd_str = @trn_kadai_kanri.kadai_updt_ymd.strftime("%Y%m%d")
  end
  if @trn_kadai_kanri.kadai_del_ymd.present?
    @trn_kadai_kanri.kadai_del_ymd_str = @trn_kadai_kanri.kadai_del_ymd.strftime("%Y%m%d")
  end
  #if @trn_kadai_kanri.kadai_updt_s_end.present?
  #  @trn_kadai_kanri.kadai_updt_s_end_str = @trn_kadai_kanri.kadai_updt_s_end.strftime("%Y%m%d")
  #end  
  #if @trn_kadai_kanri.kadai_updt_t_end.present?
  #  @trn_kadai_kanri.kadai_updt_t_end_str = @trn_kadai_kanri.kadai_updt_t_end.strftime("%Y%m%d")
  #end
end

#登録画面 登録ボタン押下時のアクション
def create
 
  #POSTされた値を元にTrnKadaiKanrisテーブル登録用レコードを作成
  @trn_kadai_kanri = TrnKadaiKanri.new(trn_kadai_kanri_params)

  #エラーチェック
  if @trn_kadai_kanri.valid?
    #--------------
    #エラーがない場合
    #--------------
    if @trn_kadai_kanri.kadai_limit_str.present?
      @trn_kadai_kanri.kadai_limit = Date.new(
        @trn_kadai_kanri.kadai_limit_str[0..3].to_i,
        @trn_kadai_kanri.kadai_limit_str[4..5].to_i,
        @trn_kadai_kanri.kadai_limit_str[6..7].to_i)
    end
    if @trn_kadai_kanri.kadai_try_d_str.present?
      @trn_kadai_kanri.kadai_try_d = Date.new(
        @trn_kadai_kanri.kadai_try_d_str[0..3].to_i,
        @trn_kadai_kanri.kadai_try_d_str[4..5].to_i,
        @trn_kadai_kanri.kadai_try_d_str[6..7].to_i)
    end
    if @trn_kadai_kanri.kadai_try2_d_str.present?
      @trn_kadai_kanri.kadai_try2_d = Date.new(
        @trn_kadai_kanri.kadai_try2_d_str[0..3].to_i,
        @trn_kadai_kanri.kadai_try2_d_str[4..5].to_i,
        @trn_kadai_kanri.kadai_try2_d_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_try3_d_str.present?
      @trn_kadai_kanri.kadai_try3_d = Date.new(
        @trn_kadai_kanri.kadai_try3_d_str[0..3].to_i,
        @trn_kadai_kanri.kadai_try3_d_str[4..5].to_i,
        @trn_kadai_kanri.kadai_try3_d_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_inst_ymd_str.present?
      @trn_kadai_kanri.kadai_inst_ymd = Date.new(
        @trn_kadai_kanri.kadai_inst_ymd_str[0..3].to_i,
        @trn_kadai_kanri.kadai_inst_ymd_str[4..5].to_i,
        @trn_kadai_kanri.kadai_inst_ymd_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_updt_ymd_str.present?
      @trn_kadai_kanri.kadai_updt_ymd = Date.new(
        @trn_kadai_kanri.kadai_updt_ymd_str[0..3].to_i,
        @trn_kadai_kanri.kadai_updt_ymd_str[4..5].to_i,
        @trn_kadai_kanri.kadai_updt_ymd_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_del_ymd_str.present?
      @trn_kadai_kanri.kadai_del_ymd = Date.new(
        @trn_kadai_kanri.kadai_del_ymd_str[0..3].to_i,
        @trn_kadai_kanri.kadai_del_ymd_str[4..5].to_i,
        @trn_kadai_kanri.kadai_del_ymd_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_updt_s_end_str.present?
      @trn_kadai_kanri.kadai_updt_s_end = Date.new(
        @trn_kadai_kanri.kadai_updt_s_end_str[0..3].to_i,
        @trn_kadai_kanri.kadai_updt_s_end_str[4..5].to_i,
        @trn_kadai_kanri.kadai_updt_s_end_str[6..7].to_i)
    end 
    if @trn_kadai_kanri.kadai_updt_t_end_str.present?
      @trn_kadai_kanri.kadai_updt_t_end = Date.new(
        @trn_kadai_kanri.kadai_updt_t_end_str[0..3].to_i,
        @trn_kadai_kanri.kadai_updt_t_end_str[4..5].to_i,
        @trn_kadai_kanri.kadai_updt_t_end_str[6..7].to_i)
    end 
    
    
    
    
    
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @trn_kadai_kanri.kadai_kanryo == true
          else
           @trn_kadai_kanri.kadai_kanryo = false
        end
        #親工程フラグをセットする。未入力の場合でもfalseでセットする
        #if @task.step_ownership_flg == true
        #else
        # @task.step_ownership_flg = false
        #end
        #ここの記述は大丈夫そう
        @user = MstUser.find(current_user.id)
        #↓とりあえずべた書き。ログインユーザの情報を取得
        @trn_kadai_kanri.pj_id = @user.pj_id
        @trn_kadai_kanri.hojn_id = @user.hojn_id
        @trn_kadai_kanri.kadai_psner = @user.user_id

        #とりあえずべた書き。現在時刻を取得する
        target = DateTime.now
        @trn_kadai_kanri.kadai_limit = target
        @trn_kadai_kanri.kadai_del_flag = false
 
#更新（エラーチェックを行わない）
  @trn_kadai_kanri.save(validate:false)
  
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "登録しました。"
 
    #一覧画面へリダイレクト
    redirect_to trn_kadai_kanris_path
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
  @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])
 
  #レコードをPOSTされた値(入力値)で上書き
  @trn_kadai_kanri.assign_attributes(trn_kadai_kanri_params)
 
  #エラーチェック
  if @trn_kadai_kanri.valid?
    #--------------
    #エラーがない場合
    #--------------
    if @trn_kadai_kanri.kadai_limit_str.present?
      @trn_kadai_kanri.kadai_limit = Date.new(
        @trn_kadai_kanri.kadai_limit_str[0..3].to_i,
        @trn_kadai_kanri.kadai_limit_str[4..5].to_i,
        @trn_kadai_kanri.kadai_limit_str[6..7].to_i)
    end
    
        #完了フラグをセットする。未入力の場合でもfalseでセットする
        if @trn_kadai_kanri.kadai_kanryo == true
          else
           @trn_kadai_kanri.kadai_kanryo = false
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
        @trn_kadai_kanri.kadai_limit = target
        @trn_kadai_kanri.kadai_try_d = target
        @trn_kadai_kanri.kadai_del_flag = false

 
    #更新（エラーチェックを行わない）
    @trn_kadai_kanri.save(validate:false)
 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "編集しました。"
 
    #一覧画面へリダイレクト
    redirect_to trn_kadai_kanris_path
  else
    #--------------
    #エラー時
    #--------------
    render "edit"
  end
end

    #一覧画面 削除ボタン押下時のアクション
  def destroy
 
    #idでTrnKadaiKanrisテーブルを取得
    @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])
 
    #削除処理（delete文発行）
    @trn_kadai_kanri.destroy
 
    #フラッシュ（一度きりのセッション）にメッセージを格納
    flash[:msg] = "削除しました。"
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
  end
 
  #一覧画面 完了ボタン押下時のアクション
  def kadai_kanryo
 
    #idでTrnKadaiKanrisテーブルを取得
    @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])
 
    #kadai_kanryoにtrueをセット
    @trn_kadai_kanri. kadai_kanryo = true
 
    #更新処理（update文発行）
    @trn_kadai_kanri.save
 
    #呼び出し元URLへリダイレクト
    redirect_to request.referer
 
  end

#------------------------------------------------------------------------------
private
#------------------------------------------------------------------------------
 
#ストロングパラメータ（マスアサインメント脆弱性回避）
def trn_kadai_kanri_params
  params.require(:trn_kadai_kanri).permit(
    :pj_id,
    :hojn_id,
    :menu_id,
    :kadai_s_id,
    :kadai_title,
    :kadai_psner,
    :kadai_contents,
    :kadai_person,
    :kadai_limit_str,
    :kadai_phase,
    :kadai_impt,
    :kadai_status,
    :kadai_cgr,
    :kadai_tenp,
    :kadai_try,
    :kadai_try2,
    :kadai_try3,
    :kadai_try_d_str,
    :kadai_try2_d_str,
    :kadai_try3_d_str,
    :kadai_try_w,
    :kadai_try2_w,
    :kadai_try3_w,
    :kadai_try_p,
    :kadai_try2_p,
    :kadai_try3_p,
    :kadai_cmt_psner,
    :kadai_cmt_ents,
    :kadai_cmt_notifier,
    :kadai_inst_ymd_str,
    :kadai_updt_ymd_str,
    :kadai_del_ymd_str,
    :kadai_del_flag,
    :kadai_updt_id,
    :kadai_updt_s_end_str,
    :kadai_updt_t_end_str,
    :kadai_kanryo
  )
end

before_action :set_phaseitems, only: [:new, :create, :edit, :update]

def set_phaseitems
  @phaseitems = Phaseitem.all
end

end