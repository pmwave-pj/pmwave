class TrnManhrDetailsController < ApplicationController
  def index
    @trn_manhr_details = TrnManhrDetail.all
        .paginate(page: params[:page], per_page: 4)
    
    @trn_manhr_detail = TrnManhrDetail.new
    
  end

  def show
    @trn_manhr_details = TrnMnhrDetail.find(params[:id])
  end

  def new
    @trn_manhr_details = TrnManhrDetail.new
  end

  def create
    @trn_manhr_detail = TrnManhrDetail.new(trn_manhr_detail_params)

   target = DateTime.now
       @trn_manhr_detail.inst_ymd = target

       #↓とりあえずべた書き。本当はログインユーザの情報を取得したい
       #@user.inst_user_id = 0
       #@user.hojn_id = 0
       #@user.pj_id = 0

     #とりあえずべた書き。現在時刻を取得する
       target = DateTime.now
       @trn_manhr_detail.inst_ymd = target
       @trn_manhr_detail.del_flg = false

    if @trn_manhr_detail.save
      flash[:success] = '工数が正常に登録されました'
      redirect_to trn_manhr_details_path
    else
      flash.now[:danger] = '工数が登録できませんでした'
      render :new
    end
  end

  def edit
    @trn_manhr_details = TrnManhrDetail.find(params[:id])
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
   #@trn_budget_detail.remember_token = 'Null'
   #@trn_budget_detail.del_flg = true
   #target = DateTime.now
   #@trn_budget_detail.updt_ymd = target
   #@trn_budget_detail.del_ymd = target
   #@trn_budget_detail.updt_history_tanto = 0
   
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
      :subpj_id, 
      :team_id, 
      :pj_name, 
      :subpj_name, 
      :team_name, 
      :bg_id, 
      :bg_title, 
      :bg_kind, 
      :bg_detail, 
      :bg_unit_price, 
      :bg_quantity, 
      :bg_total_price, 
      :file,
      :inst_user_id,
      :inst_ymd,
      :del_flg,)
  end
  
end
