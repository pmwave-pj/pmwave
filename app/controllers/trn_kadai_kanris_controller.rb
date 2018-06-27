class TrnKadaiKanrisController < ApplicationController
      #一覧画面 表示のアクション

def index
 
  #データの取得
  @trn_kadai_kanris = TrnKadaiKanri
    .by_kadai_kanryo(params[:kadai_kanryo])
    .paginate(page: params[:page], per_page: 5)
    .order('kadai_kanryo asc, kadai_limit asc')
 
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

  #idで=TrnKadaiKanrisテーブルを取得
  @trn_kadai_kanri = TrnKadaiKanri.find(params[:id])

  #viewを表示（省略可）
  render "show"

end

 #登録画面 表示のアクション
def new
 
  #TrnKadaiKanrisテーブルのスキーマでモデル（ActiveRecord）を作成
  @trn_kadai_kanri = TrnKadaiKanri.new
 
  #viewを表示（省略可）
  render "new"
 
end

  #編集画面 表示のアクション
  def edit

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
    @trn_kadai_kanri.kadai_kanryo = false
 
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

#------------------------------------------------------------------------------
private
#------------------------------------------------------------------------------
 
#ストロングパラメータ（マスアサインメント脆弱性回避）
def trn_kadai_kanri_params
  params.require(:trn_kadai_kanri).permit(
    :kadai_title,
    :kadai_contents,
    :kadai_limit_str
  )
end


  #編集画面 更新ボタン押下時のア���ション
  def update

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
end
