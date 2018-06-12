class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    #ログインチェック
    signed_check
    
    @users = MstUser.all
  end

  def show
    #ログインチェック
    signed_check
    @user = MstUser.find(params[:id])
  end

  def new
    #ログインチェック
    signed_check
    @user = MstUser.new
  end

  def edit
    #ログインチェック
    signed_check
  end

  def create
    
    #ログインチェック
    signed_check
    
    @user = MstUser.new(user_params)
    if @user.save
      #sign_in @user ←作成後、作成されたユーザでログインしたくない。
      #フラッシュ（一度きりのセッション）にメッセージを格納
      flash[:msg] = "ユーザ作成が完了しました"
      #作成後はアカウント作成画面へ遷移
      redirect_to new_user_path
    else
      render 'new'
    end
  end

  def update
    #ログインチェック
    signed_check
      
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def signed_check
   if signed_in?
    else
     redirect_to root_url
   end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = MstUser.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end