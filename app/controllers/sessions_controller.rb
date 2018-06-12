class SessionsController < ApplicationController
  def new
    if signed_in?
      #TOPページにリダイレクト
      redirect_to trn_task_details_path
    else
    end
  end

  def create
    user = MstUser.find_by(user_cd: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to trn_task_details_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end