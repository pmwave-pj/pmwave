class TrnManhrDetailsController < ApplicationController
  def index
    @trn_manhr_details = TrnManhrDetail.all
        .paginate(page: params[:page], per_page: 4)
    
    @trn_manhr_detail = TrnManhrDetail.new
    
  end

  def show
    @trn_manhr_detail = TrnManhrDetail.find(params[:id])
  end

  def new

    @trn_manhr_detail = TrnManhrDetail.new

  end

  def create
    @trn_manhr_detail = TrnManhrDetail.new(trn_manhr_detail_params)

      #エラーチェック
  # if @task.valid?
        #--------------
        #エラーがない場合
        #--------------

      #ログインユーザ情報の取得
        @user = MstUser.find(current_user.id)

      #↓とりあえずべた書き。ログインユーザの情報を取得
        @trn_manhr_detail.inst_user_id = @user.user_id
        @trn_manhr_detail.hojn_id = @user.hojn_id
        @trn_manhr_detail.pj_id = @user.pj_id

     #とりあえずべた書き。現在時刻を取得する
       target = DateTime.now
       @trn_manhr_detail.inst_ymd = target
       @trn_manhr_detail.del_flg = false

       @trn_manhr_detail.save(validate:false)

      flash[:success] = '工数が正常に登録されました'
      redirect_to trn_manhr_details_path
      else
        #--------------
        #エラー時
        #--------------
        #登録画面のviewを再表示
#        render "new"
#      end
  end

  def edit

    @trn_manhr_detail = TrnManhrDetail.find(params[:id])

      #期限に値がある場合、日付型から文字列へ変換
      if @trn_manhr_detail.kaishiyotei_ymd.present?
        @trn_manhr_detail.kaishiyotei_ymd_str = @trn_manhr_details.kaishiyotei_ymd.strftime("%Y%m%d")
      end
      if @trn_manhr_detail.syuryouyotei_ymd.present?
        @trn_manhr_detail.syuryouyotei_ymd_str = @trn_manhr_details.syuryouyotei_ymd.strftime("%Y%m%d")
      end
      if @trn_manhr_detail.start_ymd.present?
        @trn_manhr_detail.start_ymd_str = @trn_manhr_details.start_ymd.strftime("%Y%m%d")
      end
      if @trn_manhr_detail.end_ymd.present?
        @trn_manhr_detail.end_ymd_str = @trn_manhr_details.end_ymd.strftime("%Y%m%d")
      end


  end

  def update
    @trn_manhr_detail = TrnManhrDetail.find(params[:id])

       target = DateTime.now
       @trn_manhr_detail.updt_ymd = target


    if @trn_manhr_detail.update(trn_manhr_detail_params)
      flash[:success] = '工数は正常に更新されました'
      redirect_to @trn_manhr_detail
    else
      flash.now[:danger] = '工数は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @trn_manhr_detail = TrnManhrDetail.find(params[:id])
    @trn_manhr_detail.destroy

   #削除処理（論理削除）
   #@trn_manhr_detail.remember_token = 'Null'
   #@trn_manhr_detail.del_flg = true
   #target = DateTime.now
   #@trn_manhr_detail.updt_ymd = target
   #@trn_manhr_detail.del_ymd = target
   #@trn_manhr_detail.updt_history_tanto = 0
   
   #更新（エラーチェックを行わない）
   @trn_manhr_detail.save(validate:false)


    flash[:success] = '予算は正常に削除されました'
    redirect_to trn_manhr_details_url
  end

  private

  def set_trn_manhr_detail
    @trn_manhr_detail = TrnManhrDetail.find(params[:bg_id])
  end

  def trn_manhr_detail_params
    params.require(:trn_manhr_detail).permit(
      :pj_id,
      :mh_id, 
      :mh_work_tim, 
      :mh_detail, 
      :inst_user_id,
      :inst_ymd,
      :del_flg,)
  end
  
end
