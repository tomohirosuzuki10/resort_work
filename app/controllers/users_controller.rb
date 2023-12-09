class UsersController < ApplicationController
  before_action :set_user
  
  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
  end
  
  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_valid: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to new_user_registration_path
  end
 private
  def set_user
      @user = current_user
  end
  
  def user_params
     params.permit(:name, :sex, :introduction, :career, :good_place,  :email, :password, :password_confirmation, :prefecture_id)
  end
end