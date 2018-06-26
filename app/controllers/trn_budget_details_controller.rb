class TrnBudgetDetailsController < ApplicationController

  def index
    @trn_budget_details = TrnBudgetDetail.all
        .paginate(page: params[:page], per_page: 4)
    
    @trn_budget_detail = TrnBudgetDetail.new
  end

  def show
    @trn_budget_details = TrnBudgetDetail.find(params[:id])
  end

  def new
    @trn_budget_details = TrnBudgetDetail.new
  end

  def create
    @trn_budget_detail = TrnBudgetDetail.new(trn_budget_detail_params)

   target = DateTime.now
       @trn_budget_detail.inst_ymd = target

       #↓とりあえずべた書き。本当はログインユーザの情報を取得したい
       #@user.inst_user_id = 0
       #@user.hojn_id = 0
       #@user.pj_id = 0

     #とりあえずべた書き。現在時刻を取得する
       target = DateTime.now
       @trn_budget_detail.inst_ymd = target
       @trn_budget_detail.del_flg = false

    if @trn_budget_detail.save
      flash[:success] = '予算が正常に登録されました'
      redirect_to trn_budget_details_path
    else
      flash.now[:danger] = '予算が登録できませんでした'
      render :new
    end
  end

  def edit
    @trn_budget_details = TrnBudgetDetail.find(params[:id])
  end

  def update
    @trn_budget_detail = TrnBudgetDetail.find(params[:id])

       target = DateTime.now
       @trn_budget_detail.updt_ymd = target


    if @trn_budget_detail.update(trn_budget_detail_params)
      flash[:success] = '予算は正常に更新されました'
      redirect_to @trn_budget_detail
    else
      flash.now[:danger] = '予算は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @trn_budget_detail = TrnBudgetDetail.find(params[:id])
    @trn_budget_detail.destroy

   #削除処理（論理削除）
   #@trn_budget_detail.remember_token = 'Null'
   #@trn_budget_detail.del_flg = true
   #target = DateTime.now
   #@trn_budget_detail.updt_ymd = target
   #@trn_budget_detail.del_ymd = target
   #@trn_budget_detail.updt_history_tanto = 0
   
   #更新（エラーチェックを行わない）
   @trn_budget_detail.save(validate:false)


    flash[:success] = '予算は正常に削除されました'
    redirect_to trn_budget_details_url
  end

  private

  def set_trn_budget_detail
    @trn_budget_detail = TrnBudgetDetail.find(params[:bg_id])
  end

  def trn_budget_detail_params
    params.require(:trn_budget_detail).permit(
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
