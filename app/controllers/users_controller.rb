class UsersController < ApplicationController
    PER = 6
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_without_password(user_params)
    redirect_to user_url
  end

  def mypage
  end
  
  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to new_user_registration_path
  end
 private
  
  
  def user_params
     params.permit(:name, :sex, :introduction, :career, :good_place,  :email, :password, :password_confirmation, :prefecture_id, :image)
  end
end